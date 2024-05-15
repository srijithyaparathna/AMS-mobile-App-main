
import 'package:appointmentms/pages/SignUp%20S/studentverify.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class StudentSignup1 extends StatefulWidget {
  const StudentSignup1({Key? key}) : super(key: key);

  @override
  State<StudentSignup1> createState() => _LecturerSignUpState2();
}

 TextEditingController emailController = TextEditingController();

class _LecturerSignUpState2 extends State<StudentSignup1> {
  String message = "";
  TextEditingController stdEmailController = TextEditingController();
  List<dynamic> tempUsers = [];
  List<dynamic> students = [];
  List<dynamic> email= [];
  
  get sessionStorage => null;

   Future<void> sendVerificationMail(String email, String code) async {
    final url = Uri.parse('http://localhost:8080/mail/student/verify');
    try {
      final response = await http.post(
        url,
        body: json.encode({"email": email, "code": code}),
        headers: {"Content-Type": "application/json"},
      );
      print(json.decode(response.body));
    } catch (err) {
      print(err);
    }
  }

   Future<void> updateVerificationCode(String email, String verificationCode) async {
    final url = Uri.parse('http://localhost:8080/db/tempUser');
    try {
      final response = await http.put(
        url,
        body: json.encode({"Email": email, "Verification_Code": verificationCode}),
        headers: {"Content-Type": "application/json"},
      );
      print(json.decode(response.body));
    } catch (err) {
      print(err);
    }
  }

Future<void> addTempUser(String email, String verificationCode) async {
    final url = Uri.parse('http://localhost:8080/db/tempUser');
    try {
      final response = await http.post(
        url,
        body: json.encode({"Email": email, "Verification_Code": verificationCode}),
        headers: {"Content-Type": "application/json"},
      );
      print(json.decode(response.body));
    } catch (err) {
      print(err);
    }
  }
 Future<void> getAllStudents() async {
    final url = Uri.parse('http://localhost:8080/db/students');
    try {
      final response = await http.get(url);
      setState(() {
        students = json.decode(response.body);
      });
    } catch (err) {
      print(err);
    }
  }


Future<void> getAllTempUsers() async {
    final url = Uri.parse('http://localhost:8080/db/tempUsers');
    try {
      final response = await http.get(url);
      setState(() {
        tempUsers = json.decode(response.body);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllStudents();
    getAllTempUsers();
  }




void handleSubmit() {
  print("handlesubmit ");
  String stdEmail = stdEmailController.text;
  if (stdEmail == "") {
    setState(() {
      message = "Email is required";
      print("email is required");
    });
  } else if (!stdEmail.contains("engug.ruh.ac.lk")) {
    setState(() {
      message = "Please enter a valid email";
    });
  } else {
    String code = '${DateTime.now().millisecondsSinceEpoch}';
    var student = students.firstWhere((student) => student['Email'] == stdEmail, orElse: () => null);
    var tempUser = tempUsers.firstWhere((tempUser) => tempUser['Email'] == stdEmail, orElse: () => null);
    if (student == null && (tempUser == null || !tempUser['Verified'])) {
      sendVerificationMail(stdEmail, code);
      if (tempUser == null) {
        addTempUser(stdEmail, code);
      }
      if (tempUser != null && !tempUser['Verified']) {
        updateVerificationCode(stdEmail, code);
      }
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentSignUp3(), // Replace with your actual destination
      ),
    );
      // Push the "/signup/verify" route onto the navigation stack
     
    } else {
      setState(() {
        message = "Email already exists";
      });
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70.0),
            Center(child: AppLargeText(text: "SIGN UP")),
            SizedBox(height: 45.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),


            ),
            SizedBox(height: 55.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentSignup1(), // Replace with the actual widget
                  ),
                );
              },
              child: Buttons(text: "CONTINUE", onPressed: () { 
                    print("continue");
                    handleSubmit();
               },),
            ),
            
            SizedBox(height: 25.0),
            
            SizedBox(height: 25.0),
        
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
