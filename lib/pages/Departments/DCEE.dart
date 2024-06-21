import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:appointmentms/pages/CalenderViews/DailyView.dart';

class DCEE extends StatefulWidget {
  const DCEE({Key? key});

  @override
  _DEIEState createState() => _DEIEState();
}

class _DEIEState extends State<DCEE> {
  String dropdownValue = 'Choose Role'; // Default value for the dropdown
  List<dynamic> allStaff = [];

  @override
  void initState() {
    super.initState();
    getAllStaff();
  }

  Future<void> getAllStaff() async {
    try {
      final url = Uri.parse('http://192.168.1.3/db/staffList');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          allStaff = json.decode(response.body);
        });
      } else {
        print('Error: ${response.statusCode}');
        print('Message: ${response.reasonPhrase}');
      }
    } catch (err) {
      print('Error: $err');
    }
  }

  Future<void> storeEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('staffEmail', email);
  }

  Future<void> printStoredEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('staffEmail');
    if (email != null) {
      print('Stored Email: $email');
    } else {
      print('No email found in SharedPreferences.');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredStaff = allStaff.where((staff) => staff['Department'] == 'DCEE').toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Department of"),
            Text("Civil and Environmental Engineering"),
          ],
        ),
        backgroundColor: const Color(0xFFA1CCEB),
        centerTitle: true,
      ),
      body: filteredStaff.isNotEmpty
          ? ListView.builder(
              itemCount: filteredStaff.length,
              itemBuilder: (context, index) {
                var staff = filteredStaff[index];
                return StaffCard(
                  pictureUrl: staff['Picture_URL'] ?? 'https://via.placeholder.com/150',
                  firstName: staff['First_name'],
                  lastName: staff['Last_name'],
                  department: staff['Department'],
                  email: staff['Email'],
                  onViewButtonPressed: () async {
                    await storeEmail(staff['Email']);
                    await printStoredEmail();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DailyView(selectedDate: DateTime.now()),
                      ),
                    );
                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: AfterLoginBottomNavigation(),
    );
  }
}

class StaffCard extends StatelessWidget {
  final String pictureUrl;
  final String firstName;
  final String lastName;
  final String department;
  final String email;
  final VoidCallback onViewButtonPressed;

  const StaffCard({
    required this.pictureUrl,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.email,
    required this.onViewButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(pictureUrl),
              radius: 30,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Department: $department',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10), // Add some space between email and button
                  ElevatedButton(
                    onPressed: onViewButtonPressed,
                    child: Text('View'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
