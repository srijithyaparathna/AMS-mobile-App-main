import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/SideBar.dart';
import 'package:appointmentms/widgets/appBar.dart';
import 'package:appointmentms/widgets/bottomnavigation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class DailyView extends StatefulWidget {
  final DateTime selectedDate;
  const DailyView({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<DailyView> createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  bool showEventAddingBox = false;
  bool showAnotherFormBox = false;
  DateTime? selectedSlotStartTime;
  int appointmentId = 0;
  TimeOfDay? _selectedFromTime;
  TimeOfDay? _selectedToTime;

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  String _selectedStatus = "New";
  List<String> _statusOptions = ["New", "Unable"];

  String getColor(String status) {
    switch (status) {
      case 'New':
        return '#FFD700';
      case 'Blocked':
        return '#FF6347';
      case 'Confirmed':
        return '#32CD32';
      case 'Unable':
        return '#87CEFA';
      default:
        return '#FFD700';
    }
  }

  List<Appointment> _appointments = [];

  String? storedEmail;
  String? storedRegNumber;

  @override
  void initState() {
    super.initState();
    _retrieveStoredEmail();
    _retrieveStoredRegNumber();
  }

  Future<void> _retrieveStoredEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedEmail = prefs.getString('staffEmail');
    });
  }

  Future<void> _retrieveStoredRegNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedRegNumber = prefs.getString('Reg_number');
    });
  }

  Future<Map<String, dynamic>> getStudentDetails(String storedRegNumber) async {
    try {
      final url = 'http://192.168.8.94/db/student/details/$storedRegNumber';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to load student details: ${response.statusCode}');
        return {};
      }
    } catch (err) {
      print(err);
      return {};
    }
  }

  void _handleSlotTap(DateTime startTime) {
    setState(() {
      selectedSlotStartTime = startTime;
      showEventAddingBox = true;
    });
  }

  Future<void> _selectTime(BuildContext context, bool isFromTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFromTime) {
          _selectedFromTime = picked;
          _fromController.text = picked.format(context);
        } else {
          _selectedToTime = picked;
          _toController.text = picked.format(context);
        }
      });
    }
  }

  bool doesOverlap(DateTime start, DateTime end) {
  for (var appointment in _appointments) {
    if (start.isBefore(appointment.endTime) && end.isAfter(appointment.startTime)) {
      return true;
    }
  }
  return false;
}
void _addAppointment() {
  if (selectedSlotStartTime != null &&
      _selectedFromTime != null &&
      _selectedToTime != null &&
      storedEmail != null &&
      storedRegNumber != null) {
    final DateTime startDateTime = DateTime(
      selectedSlotStartTime!.year,
      selectedSlotStartTime!.month,
      selectedSlotStartTime!.day,
      _selectedFromTime!.hour,
      _selectedFromTime!.minute,
    );
    final DateTime endDateTime = DateTime(
      selectedSlotStartTime!.year,
      selectedSlotStartTime!.month,
      selectedSlotStartTime!.day,
      _selectedToTime!.hour,
      _selectedToTime!.minute,
    );

    // Check for overlapping appointments
    if (doesOverlap(startDateTime, endDateTime)) {
      print('Time slot overlaps with an existing appointment.');
      return;
    }

    // Create the appointment with a unique ID
    final String uniqueId = uuid.v4();
    final Appointment appointment = Appointment(
      startTime: startDateTime,
      endTime: endDateTime,
      subject: _summaryController.text,
      color: Colors.blue,
      id: uniqueId,
    );

    setState(() {
      _appointments.add(appointment);
    });

    // Add appointment to the backend
    addAppointmentBackend(
      uniqueId,
      storedEmail!,
      storedRegNumber!,
      _summaryController.text,
      _reasonController.text,
      appointment.startTime,
      appointment.endTime,
      _selectedStatus,
    );
  }
}

Future<void> addAppointmentBackend(
    String id,
    String storedEmail,
    String storedRegNumber,
    String subject,
    String description,
    DateTime startTime,
    DateTime endTime,
    String status) async {
  print("Posting appointment to database...");
  try {
    final url = 'http://192.168.8.94/db/appointment/add';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'Id': id,
        'Lecturer_mail': storedEmail,
        'Student_reg': storedRegNumber,
        'Subject': subject,
        'Description': description,
        'StartTime': startTime.toIso8601String(),
        'EndTime': endTime.toIso8601String(),
        'Apt_status': status,
      }),
    );

    if (response.statusCode == 200) {
      print('Appointment added successfully');
    } else {
      print('Failed to add appointment: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (err) {
    print('Error: $err');
  }
}
  List<Appointment> getAppointments() {
    return _appointments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              SfCalendar(
                view: CalendarView.day,
                dataSource: MeetingDataSource(getAppointments()),
                onTap: (CalendarTapDetails details) {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    _handleSlotTap(details.date!);
                  }
                },
                timeSlotViewSettings: const TimeSlotViewSettings(
                  timeInterval: Duration(minutes: 30),
                  timeIntervalWidth: 60,
                  timeFormat: 'h:mm a',
                  timeRulerSize: 80,
                  timeTextStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                ),
                selectionDecoration: BoxDecoration(
                  color: Color(0xFFA1CCEB).withOpacity(0.5),
                  border: Border.all(
                      color: Color.fromARGB(255, 178, 214, 239), width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              if (showEventAddingBox && !showAnotherFormBox)
                Positioned(
                  top: 120,
                  left: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Appointment',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                            'Selected Slot: ${DateFormat('MMM dd, yyyy hh:mm a').format(selectedSlotStartTime!)}'),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showEventAddingBox = false;
                                  showAnotherFormBox = true;
                                });
                              },
                              child: Text('Add Event'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showEventAddingBox = false;
                                });
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              if (showAnotherFormBox)
                Positioned(
                  top: 120,
                  left: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Add Appointment Details',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _fromController,
                                  decoration: InputDecoration(
                                    labelText: 'From',
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.access_time),
                                      onPressed: () =>
                                          _selectTime(context, true),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _toController,
                                  decoration: InputDecoration(
                                    labelText: 'To',
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.access_time),
                                      onPressed: () =>
                                          _selectTime(context, false),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _summaryController,
                                  decoration: InputDecoration(
                                    labelText: 'Summary',
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _reasonController,
                                  decoration: InputDecoration(
                                    labelText: 'Reason',
                                  ),
                                ),
                                SizedBox(height: 10),
                                DropdownButtonFormField<String>(
                                  value: _selectedStatus,
                                  items: _statusOptions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedStatus = newValue!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Status',
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: _addAppointment,
                                  child: Text('Add Appointment'),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showAnotherFormBox = false;
                                    });
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
