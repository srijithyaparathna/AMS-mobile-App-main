import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarcommon(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 350, // Set the width as needed
              height: 475, // Set the height as needed
              //color: Color(0xFFD3E3E9), // Set the background color here
              child: Column(
                
                children: [
                  SizedBox(height: 75),
                  //AppLargeText3(text: "______________________________________"),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.location_on, size: 30.0, color: Color(0xFF500512)),
                      const SizedBox(width: 50,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText3(text: "Faculty of Engineering"),
                            AppLargeText3(text: "University of Ruhuna"),
                            AppLargeText3(text: "Hapugala, Galle,"),
                            AppLargeText3(text: "Sri Lanka"),
                          ],
                        ),
                      )

                    ],
                  ),
                  AppLargeText3(text: "______________________________________"),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.phone, size: 30.0, color: Color(0xFF500512)),
                      const SizedBox(width: 50,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText3(text: "+(94) 0 91 2245765/6"),
                            
                          ],
                        ),
                      )

                    ],
                  ),
                  AppLargeText3(text: "______________________________________"),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.phone, size: 30.0, color: Color(0xFF500512)),
                      const SizedBox(width: 50,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText3(text: "+(94) 91-2245764-5-8"),
                            
                          ],
                        ),
                      )

                    ],
                  ),
                  AppLargeText3(text: "______________________________________"),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.mail_outline, size: 30.0, color: Color(0xFF500512)),
                      const SizedBox(width: 50,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText3(text: "webmaster@eng.ruh.ac.lk"),
                            
                          ],
                        ),
                      )

                    ],
                  ),
                  AppLargeText3(text: "______________________________________"),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Icon(Icons.person, size: 30.0, color: Color(0xFF500512)),
                      const SizedBox(width: 50,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText3(text: "dean@eng.ruh.ac.lk"),
                            
                          ],
                        ),
                      )

                    ],
                  ),
                  AppLargeText3(text: "______________________________________"),


                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation2(),
    );
  }
}
