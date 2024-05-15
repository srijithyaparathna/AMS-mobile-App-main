import 'package:appointmentms/pages/CalenderViews/DailyView.dart';
import 'package:appointmentms/widgets/AfterSignUpBottpm.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/miniText.dart';
import 'package:flutter/material.dart';

class COM extends StatefulWidget {
  const COM({super.key});

  @override
  State<COM> createState() => _COMState();
}

class _COMState extends State<COM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: const Color(0xFFA1CCEB),
           leading: Padding(
            padding: const EdgeInsets.only(left: 4.0,top: 28), 
          ),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 50.0),
                  AppLargeText3(text: "Department of "),
                  AppLargeText3(text: "Computer Engineering"),
                ],
              ),
                const SizedBox(width  : 50.0),
              /*Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                'assets/mech.jpg', // Replace with your image path
                height: 65.0,
                width: 65.0,
                            ),
              ),*/
            ],
          ),
        ),
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25,left: 25),
          child: Column(
            children: [Container(
                    width: 170, 
                    height: 120, 
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), 
                color: Color.fromARGB(255, 180, 200, 212)
                
                    ),
                  ),
              
              SizedBox(height: 1,),
               Container(
                    width: 170, 
                    height: 75, 
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), 
                color: Color.fromARGB(255, 180, 200, 212),
                    ),
                    child: Column(
                      children: [
                        BottomText2(text: "ABC"),
                        ElevatedButton(
                      onPressed: () { 
                      DateTime today = DateTime.now();
                      var selectedDate;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            
                            builder: (context) => DailyView(selectedDate:today, ), 
                          ),
                        );
                  },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        
                        backgroundColor: const Color(0xFF500512),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "VIEW",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                        
                      ],
                    ),

                  ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AfterLoginBottomNavigation(),
    );
  }
}

