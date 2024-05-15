import 'package:appointmentms/pages/Login/Lecturer_login.dart';
import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key});
  

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  
  String? _selectedRole; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        children: [
          TextButton(
            onPressed: () => _showMenu(context),
            child: const Text(
              'LOGIN',
              style: TextStyle(
                  color: Color(0xFF500512),
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 100, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          value: 'Lecturer',
          child:  AppLargeText3(text: "STAFF"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'Student',
          child: AppLargeText3(text: "STUDENT"), // You can customize the appearance here
        ),
      ],
    );
    if (result != null) {
    setState(() {
      _selectedRole = result;
    });

 
  if (result == 'Lecturer') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  LectureLogin(), 
      ),
    );
  } else if (result == 'Student') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentLogin(), 
      ),
    );
  }
  }
  }}
