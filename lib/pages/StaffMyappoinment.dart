import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StaffMyappointment extends StatefulWidget {
  const StaffMyappointment({Key? key}) : super(key: key);

  @override
  _StaffMyappointmentState createState() => _StaffMyappointmentState();
}

class _StaffMyappointmentState extends State<StaffMyappointment> {
  String? storedEmail;
  List<dynamic> appointments = [];

  @override
  void initState() {
    super.initState();
    _retrieveStoredEmail();
  }

  Future<void> _retrieveStoredEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedEmail = prefs.getString('email');
    });
    if (storedEmail != null) {
      await fetchAppointments(storedEmail!);
    }
  }

  Future<void> fetchAppointments(String email) async {
    try {
      final url = 'http://192.168.1.3/db/appointments/$email';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> fetchedAppointments = jsonDecode(response.body);
        setState(() {
          appointments = fetchedAppointments;
          print('Appointments: $appointments');
        });
      } else {
        throw Exception('Failed to load appointments');
      }
    } catch (err) {
      print('Error fetching appointments: $err');
      setState(() {
        appointments = [];
      });
    }
  }

 Future<void> updateAppointment(String id, String aptStatus) async {
    try {
      final url = Uri.parse('http://192.168.1.3/db/appointment');
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Id': id,
          'Apt_status': aptStatus,
        }),
      );

      if (response.statusCode == 200) {
        print('Appointment updated successfully');
        if (storedEmail != null) {
          await fetchAppointments(storedEmail!);
        }
      } else {
        print('Failed to update appointment. Server responded with status code: ${response.statusCode}');
        throw Exception('Failed to update appointment');
      }
    } catch (err) {
      print('Error updating appointment: $err');
      throw err;
    }
  }

  Future<void> _rejectAppointment(String id) async {
    try {
      final url = Uri.parse('http://192.168.1.3/db/appointment');
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Id': id,
          'Apt_status': 'Rejected',
        }),
      );

      if (response.statusCode == 200) {
        print('Appointment rejected successfully');
        // Assuming storedEmail is a global variable or accessible contextually
        if (storedEmail != null) {
          await fetchAppointments(storedEmail!);
        }
      } else {
        print(
            'Failed to reject appointment. Server responded with status code: ${response.statusCode}');
        throw Exception('Failed to reject appointment');
      }
    } catch (err) {
      print('Error rejecting appointment: $err');
      // Optionally, re-throw the error if further handling is needed
      throw err;
    }
  }


 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: const Color(0xFFA1CCEB),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 32, left: 10),
                  child: Image.asset(
                    'assets/imag.png',
                    height: 85.0,
                    width: 131.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MY Appointment',
                        style: TextStyle(
                          color: Color(0xFF500512),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: storedEmail == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Logged in as: $storedEmail',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: appointments.length,
                      itemBuilder: (context, index) {
                        final appointment = appointments[index];
                        return AppointmentCard(
                          appointment: appointment,
                          onAccept: (id) {
                            updateAppointment(id, 'Confirmed'); // Call updateAppointment with id
                          },
                          onReject: (id) {
                            _rejectAppointment(id); // Call _rejectAppointment with id
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: AfterLoginBottomNavigation(),
      ),
    );
  }
}
class AppointmentCard extends StatelessWidget {
  final Map<dynamic, dynamic> appointment;
  final Function(String id) onAccept; // Accepts id as parameter
  final Function(String id) onReject; // Accepts id as parameter

  const AppointmentCard({
    Key? key,
    required this.appointment,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure you access the correct key with the capitalized 'Id'
    String id = appointment['Id']?.toString() ?? '';

    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _buildTableRow('Id:', appointment['Id']),
            _buildTableRow('Lecturer Mail:', appointment['Lecturer_mail']),
            _buildTableRow('Subject:', appointment['Subject']),
            _buildTableRow('Student Reg:', appointment['Student_reg']),
            _buildTableRow('Description:', appointment['Description']),
            _buildTableRow('Start Time:', appointment['StartTime']),
            _buildTableRow('End Time:', appointment['EndTime']),
            _buildTableRow('Status:', appointment['Apt_status']),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Actions:'),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => onAccept(id), // Pass id to onAccept callback
                          child: Text('Accept'),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () => onReject(id), // Pass id to onReject callback
                          child: Text('Reject'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, dynamic value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Text(label),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Text(value?.toString() ?? 'N/A'),
          ),
        ),
      ],
    );
  }
}
