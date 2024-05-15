import 'package:appointmentms/pages/Login/Lecturer_login.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class LecturerResetPassword extends StatefulWidget {
  const LecturerResetPassword({Key? key}) : super(key: key);

  @override
  State<LecturerResetPassword> createState() => _LecturerResetPasswordState();
}

class _LecturerResetPasswordState extends State<LecturerResetPassword> {
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
        builder: (context) => LectureLogin(), // Replace with your actual destination
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
