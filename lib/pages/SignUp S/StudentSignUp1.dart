import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'studentverify.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';

class StudentSignup1 extends StatefulWidget {
  const StudentSignup1({Key? key}) : super(key: key);

  @override
  State<StudentSignup1> createState() => _StudentSignup1State();
}

class _StudentSignup1State extends State<StudentSignup1> {
  TextEditingController emailController = TextEditingController();
  List<dynamic> tempUsers = [];
  List<dynamic> students = [];
  String message = "";
  void storeEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('stdEmail', email);
  }

  void sendVerificationMail(String email, String code) async {
    // Save the email in secure storage
    storeEmail(email);

    final url = Uri.parse('http://192.168.1.3/mail/student/verify');
    final body = json.encode({'email': email, 'code': code});

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
      } else {
        print('Failed to send verification mail: ${response.statusCode}');
      }
    } catch (err) {
      print('Error: $err');
    }
  }

  void updateVerificationCode(String email, String verificationCode) async {
    final url = Uri.parse('http://192.168.1.3/db/tempUser');
    final body =
        json.encode({'Email': email, 'Verification_Code': verificationCode});

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
      } else {
        print('Failed to update verification code: ${response.statusCode}');
      }
    } catch (err) {
      print('Error: $err');
    }
  }

  void addTempUser(String email, String verificationCode) async {
    final url = Uri.parse('http://192.168.1.3/db/tempUser');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "Email": email,
          "Verification_Code": verificationCode,
          "First_Name": "", // Add default values for additional fields
          "Last_Name": "", // Add default values for additional fields
          "Picture_URL": "" // Add default values for additional fields
        }),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      } else {
        print('Error: ${response.statusCode} ${response.reasonPhrase}');
        print(json.decode(response.body));
      }
    } catch (err) {
      print(err);
    }
  }

  void getAllStudents() async {
    final url = Uri.parse('http://192.168.1.3/db/students');
    try {
      final response = await http.get(url);
      setState(() {
        students = json.decode(response.body);
      });
    } catch (err) {
      print(err);
    }
  }

  void getAllTempUsers() async {
    final url = Uri.parse('http://192.168.1.3/db/tempUsers');
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

  final random = Random();

  void handleSubmit() {
    String stdEmail = emailController.text;

    if (stdEmail.isEmpty) {
      setState(() {
        message = "Email is required";
        print("Email is required");
      });
    } else if (!stdEmail.contains("engug.ruh.ac.lk")) {
      setState(() {
        message = "Please enter a valid email";
      });
    } else {
      final code =
          '${random.nextInt(10)}${random.nextInt(10)}${random.nextInt(10)}${random.nextInt(10)}';
      print(code);
      print(stdEmail);
      final student = students.firstWhere(
          (student) => student['Email'] == stdEmail,
          orElse: () => null);
          print(student);
      final tempUser = tempUsers.firstWhere(
          (tempUser) => tempUser['Email'] == stdEmail,
          orElse: () => null);
          print(tempUser);
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
            builder: (context) =>
                StudentSignUp3(), // Replace with your actual destination
          ),
        );
      } else {
        setState(() {
          message = "Email already exists";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarcommon(),
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
                handleSubmit();
              },
              child: Buttons(
                text: "CONTINUE",
                onPressed: () {
                  print("continue");
                  handleSubmit();
                },
              ),
            ),
            SizedBox(height: 25.0),
            Text(message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
