import 'package:appointmentms/widgets/SideBar.dart';
import 'package:appointmentms/widgets/appBar.dart';
import 'package:appointmentms/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

class DailyView extends StatefulWidget {
  final DateTime selectedDate;
  const DailyView({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<DailyView> createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  bool showEventAddingBox = false;
  bool showAnotherFormBox = false; // New state variable for showing another form box
  DateTime? selectedSlotStartTime;

  void _handleSlotTap(DateTime startTime) {
    setState(() {
      selectedSlotStartTime = startTime;
      showEventAddingBox = true;
    });
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
                  border: Border.all(color: Color.fromARGB(255, 178, 214, 239), width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              if (showEventAddingBox && !showAnotherFormBox) // Show event adding box
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text('Selected Slot: ${DateFormat('MMM dd, yyyy hh:mm a').format(selectedSlotStartTime!)}'),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Implement your logic to show the form box for adding an event
                                setState(() {
                                  showEventAddingBox = false; // Hide the current event adding box
                                  showAnotherFormBox = true; // Show the new form box
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
              if (showAnotherFormBox) // Show another form box
                Positioned(
                  top: 90,
                  left: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 430, // Adjust the height as needed
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Appointment',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text('Date: ${DateFormat('MMM dd, yyyy').format(selectedSlotStartTime!)}'),

                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Summary'),
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Status'),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(labelText: 'From'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(labelText: 'To'),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Reason'),
                            ),
                            
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Add logic to handle adding event
                                  },
                                  child: Text('Add'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showAnotherFormBox = false;
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
