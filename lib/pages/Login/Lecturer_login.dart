import 'package:appointmentms/pages/SignUp%20L/lectureSignUp.dart';
import 'package:appointmentms/pages/SignUp%20L/lesturepasswordreset1.dart';
import 'package:appointmentms/pages/Login/StaffLoginHome.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/googleButton.dart';
import 'package:appointmentms/widgets/miniText.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class LectureLogin extends StatefulWidget {
  const LectureLogin({Key? key}) : super(key: key);

  @override
  State<LectureLogin> createState() => _LectureLoginState();
}

class _LectureLoginState extends State<LectureLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String message = "";
  String email = "";

  Future<void> _handleStaffLogin(String email, String password) async {
    try {
      print("handleStaffLogin");
      Map<String, dynamic> body = {
        'Email': email,
        'Original_password': password,
      };
      String jsonBody = jsonEncode(body);
      print(jsonBody);
      String url = 'http://192.168.8.94/db/staff/login';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );
      print("response received");
      final responseData = json.decode(response.body);
      if (responseData['Status'] == 'Success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        print('Login successful');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StaffLoginHome(),
          ),
        );
      } else {
        setState(() {
          message = 'Invalid email or password';
          print("Invalid email or password");
        });
      }
    } catch (err) {
      print(err.toString());
      setState(() {
        message = 'Invalid email or password';
      });
    }
  }

  Future<void> storeEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('StaffEmail', email);
  }

  Future<void> printStoredEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null) {
      print('Stored Email: $email');
    } else {
      print('No staff email found in SharedPreferences.');
    }
  }

  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print("handleLogin");
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        print("Please fill all the fields");
        message = 'Please fill all the fields';
      });
    } else {
      _handleStaffLogin(email, password);
      storeEmail(email);
      printStoredEmail();
    }
  }

  void _handleGoogleAuth() async {
    const String url = 'http://192.168.8.94/auth/google';
    final Uri uri = Uri.parse(url);

    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Center(child: AppLargeText2(text: "LOGIN")),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Buttons(
              text: "LOGIN",
              onPressed: () {
                print("Button clicked");
                _handleLogin();
              },
            ),
            // Row(
            //   children: [
            //     SizedBox(width: 95.0),
            //     BottomText2(text: "Forgot Password ?"),
            //     TextButton(
            //       onPressed: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => LecturepasswordReset1(),
            //         ),
            //       ),
            //       child: const Text(
            //         'RESET',
            //         style: TextStyle(
            //           color: Color(0xFF500512),
            //           decoration: TextDecoration.underline,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            //SizedBox(height: 20.0),
            // GButton(
            //   onPressed: () {
            //     print("Google button clicked");
            //     _handleGoogleAuth();
            //   },
            // ),
            //SizedBox(height: 70.0),
            // Row(
            //   children: [
            //     SizedBox(width: 67.0),
            //     BottomText2(text: "Don't have an account?"),
            //     TextButton(
            //       onPressed: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => LecturerSignUp(),
            //         ),
            //       ),
            //       child: const Text(
            //         'SIGN UP',
            //         style: TextStyle(
            //           color: Color(0xFF500512),
            //           decoration: TextDecoration.underline,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation2(),
    );
  }
}
