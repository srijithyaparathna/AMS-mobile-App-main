import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/icondropdown2.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class StudentSignUp extends StatefulWidget {
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUp();
}

class _StudentSignUp extends State<StudentSignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            Center(child: AppLargeText2(text: "SIGN UP")),
            SizedBox(height: 15.0),
            TextBox(labelText: "FirstName", width: 370, height: 40),
            SizedBox(height: 15.0),
            TextBox(labelText: "LastName", width: 370, height: 40),
            SizedBox(height: 15.0),
            TextBox(labelText: "Registration No.", width: 370, height: 40),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextBox(labelText: "Select the Department", width: 290, height: 40),
                  IconDropDown2(),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            TextBox(labelText: "Faculty Email", width: 370, height: 40),
            SizedBox(height: 15.0),
            TextBox(labelText: "Password", width: 370, height: 40),
            SizedBox(height: 15.0),
            Buttons(text: "SIGNUP", onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentLogin(), // Replace with your actual destination
                ),
              );
             },),
            SizedBox(height: 25.0),
            
        
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
