
import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class StudentResetPassword extends StatefulWidget {
  const StudentResetPassword({Key? key}) : super(key: key);

  @override
  State<StudentResetPassword> createState() => _StudentResetPasswordState();
}

class _StudentResetPasswordState extends State<StudentResetPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Center(child: AppLargeText2(text: "RESET PASSWORD")),
            SizedBox(height: 35.0),
            TextBox(labelText: "New Password", width: 390, height: 40),
            SizedBox(height: 30.0),
            TextBox(labelText: "Confirm Password", width: 390, height: 40),
            SizedBox(height: 60.0),
            Buttons(text: "CONTINUE", onPressed: () { 
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
