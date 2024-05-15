import 'package:appointmentms/pages/Login/Lecturer_login.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/icondropdown.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class LecturerSignUp4 extends StatefulWidget {
  const LecturerSignUp4({Key? key}) : super(key: key);

  @override
  State<LecturerSignUp4> createState() => _LecturerSignUpState4();
}

class _LecturerSignUpState4 extends State<LecturerSignUp4> {
  String? selectedDepartment; // Declare the selectedDepartment variable
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Center(child: AppLargeText2(text: "SIGN UP")),
            SizedBox(height: 25.0),
            TextBox(labelText: "Name", width: 370, height: 40),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextBox(labelText: "Select the Department", width: 290, height: 40),
                  IconDropDown(),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            TextBox(labelText: "Faculty Email", width: 370, height: 40),
            SizedBox(height: 25.0),
            TextBox(labelText: "Password", width: 370, height: 40),
            SizedBox(height: 25.0),
            Buttons(
              text: "SIGNUP",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LectureLogin(),
                  ),
                );
              },
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
