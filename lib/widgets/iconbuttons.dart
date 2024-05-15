import 'package:flutter/material.dart';
import 'package:appointmentms/pages/CalenderViews/calenderpage.dart';
import 'package:appointmentms/pages/contactpage.dart';
import 'package:appointmentms/pages/homepage.dart';

class Iconbuttons extends StatefulWidget {
  const Iconbuttons({Key? key}) : super(key: key);

  @override
  State<Iconbuttons> createState() => _IconbuttonsState();
}

class _IconbuttonsState extends State<Iconbuttons> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CalenderPage(),
    ContactUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Calendar',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: 'Contact Us',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
