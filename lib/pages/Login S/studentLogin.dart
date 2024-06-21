import 'package:appointmentms/pages/Login%20S/LoginHome.dart';
import 'package:appointmentms/pages/SignUp%20S/StudentSignUp1.dart';
import 'package:appointmentms/pages/SignUp%20S/StudentpasswordReset1.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:appointmentms/widgets/miniText.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

TextEditingController FacultyEmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();
String message = "";
String regNumber = "";

class _StudentLoginState extends State<StudentLogin> {
  void getRegNumber(String email) async {
    print("Getting registration number...");
    try {
      String url = "http://192.168.1.3/db/student/regnumber/$email";
      http.Response response = await http.get(Uri.parse(url));

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Decode the JSON response
        dynamic jsonData = jsonDecode(response.body);

        // Check if the decoded JSON is a list
        if (jsonData is List) {
          // Iterate through the list to print registration numbers
          for (var item in jsonData) {
            if (item is Map<String, dynamic> &&
                item.containsKey('Reg_number')) {
              regNumber = item['Reg_number'];
              print(regNumber);

              // Store the registration number using shared_preferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('Reg_number', regNumber);
            } else {
              print("Registration number not found in item: $item");
            }
          }
        }
        // Check if the decoded JSON is a map
        else if (jsonData is Map<String, dynamic>) {
          // Check if the data contains the 'Reg_number' key
          if (jsonData.containsKey('Reg_number')) {
            regNumber = jsonData['Reg_number'];
            print(regNumber);

            // Store the registration number using shared_preferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('Reg_number', regNumber);
          } else {
            print("Key 'Reg_number' not found in the response.");
          }
        } else {
          print("Unexpected response format.");
        }
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (err) {
      print("An error occurred: $err");
    }
  }

  Future<void> saveRegNumber(String regNumber) async {
    print("Saving registration number...");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Reg_number', regNumber);
  }

  Future<void> storeEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('staffEmail', email);
  }

  Future<void> printStoredRegNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? regNumber = prefs.getString('Reg_number');
    if (regNumber != null) {
      print('Stored RegNumber: $regNumber');
    } else {
      print('No RegNumber found in SharedPreferences.');
    }
  }

  void handleLogin(BuildContext context, String email, String password) async {
    try {
      print("handel login");
      Map<String, dynamic> body = {
        'Email': email,
        'Password': password,
      };
      String jsonBody = jsonEncode(body);
      print(jsonBody);

      String url = "http://192.168.1.3/db/student/login"; // API endpoint
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonBody, // Send the JSON string as the body
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      print(response.body);
      if (data['Status'] == "Success") {
        // Handle successful login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginHome()),
        );
        print("Login successful");
        print(regNumber);
        // You may want to store login state using shared_preferences or another method for persistent storage.
      } else {
        // Handle invalid credentials
        setState(() {
          message = "Invalid email or password";
          print("Invalid email or password");
        });
      }
    } catch (err) {
      // Handle network errors or other exceptions
      setState(() {
        message = "Invalid email or password";
        print("Invalid email or password");
        print(err);
      });
    }
  }

  void handleSubmit() {
    String email = FacultyEmailController.text;
    String password = PasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        message = "Please fill all the fields";
        print("please fill all the fields");
      });
    } else if (!email.contains("engug.ruh.ac.lk")) {
      setState(() {
        message = "Invalid email";
        print("Invalid email");
      });
    } else {
      handleLogin(context, email, password);
      print("handelsubmit ");
      getRegNumber(email);
      saveRegNumber(email);
      printStoredRegNumber(); // Pass context to handleLogin function
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarcommon(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.0),
            Center(child: AppLargeText2(text: "LOGIN")),
            SizedBox(height: 35.0),
            TextField(
              controller: FacultyEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 25.0),
            TextField(
              controller: PasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 50.0),
            Buttons(
              text: "Login",
              onPressed: () {
                ;
                print(" press login");
                handleSubmit();
              },
            ),
            // Row(
            //   children: [
            //     SizedBox(width: 90.0),
            //     BottomText2(text: "Forgot password ?"),
            //     TextButton(
            //       onPressed: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => StudentpasswordReset1(),
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
            // SizedBox(height: 70.0),
            // Row(
            //   children: [
            //     SizedBox(width: 67.0),
            //     BottomText2(text: "Don't have an account?"),
            //     TextButton(
            //       onPressed: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => StudentSignup1(),
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
