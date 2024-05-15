import 'package:appointmentms/pages/SignUp%20L/lectureSignUp.dart';
import 'package:appointmentms/pages/SignUp%20L/lectureSignUp3.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class LecturerSignUp2 extends StatefulWidget {
  const LecturerSignUp2({Key? key}) : super(key: key);

  @override
  State<LecturerSignUp2> createState() => _LecturerSignUpState2();
}

class _LecturerSignUpState2 extends State<LecturerSignUp2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Center(child: AppLargeText(text: "CHOOSE AN ACCOUNT")),
            SizedBox(height: 45.0),
            TextBox(labelText: "abc@gmail.com", width: 390, height: 40),
            SizedBox(height: 55.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LecturerSignUp(), // Replace with the actual widget
                  ),
                );
              },
              child: Buttons(text: "GO BACK", onPressed: () { 
                Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LecturerSignUp(), // Replace with your actual destination
      ),
    );
               },),
            ),
            
            SizedBox(height: 25.0),
            Buttons(text: "CONTINUE", onPressed: () { 
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LecturerSignUp3(), // Replace with your actual destination
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
