
import 'package:appointmentms/pages/SignUp%20S/studentSignUp.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class StudentSignUp3 extends StatefulWidget {
  const StudentSignUp3({Key? key}) : super(key: key);

  @override
  State<StudentSignUp3> createState() => _LecturerSignUpState3();
}

class _LecturerSignUpState3 extends State<StudentSignUp3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            Center(child: AppLargeText(text: "Please Enter the")),
            SizedBox(height: 10.0),
            Center(child: AppLargeText(text: "Code received in Your Email")),
            SizedBox(height: 45.0),
             Container(
              padding: EdgeInsets.only(left: 65),
              child:  Row(
                children: [
                  TextBox(labelText: " ", width: 60, height: 60),
                  SizedBox(width: 15.0),
                  TextBox(labelText: " ", width: 60, height: 60),
                  SizedBox(width: 15.0),
                  TextBox(labelText: " ", width: 60, height: 60),
                  SizedBox(width: 15.0),
                  TextBox(labelText: " ", width: 60, height: 60),
                ],
              ),
            ),
            SizedBox(height: 55.0),
            Buttons(text: "VERIFY", onPressed: () {  
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentSignUp(), // Replace with your actual destination
      ),
    );
            },),
            SizedBox(height: 25.0),
            Center(child: AppLargeText(text: "Didn't Receive the Code?")),
            SizedBox(height: 10.0),
            TextButton(
            onPressed: () {
              // Handle login link press
            },
            child: const Text(
              'Resend',
              style: TextStyle(
                color:Color(0xFF500512), // Set the link text color
                decoration: TextDecoration.underline, 
                fontSize: 22,
                fontWeight: FontWeight.bold// Add underline for link effect
              ),
            ),
          ),
        
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
