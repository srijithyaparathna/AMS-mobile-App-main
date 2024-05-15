import 'package:appointmentms/widgets/appBar.dart';
import 'package:appointmentms/widgets/appbarcommon.dart';
import 'package:appointmentms/widgets/bottomnavigationLogin.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(),
      body: Column(
        children: [
          Row(
            children: [
                
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SfCalendar(
                view: CalendarView.month,
              ),
          ),
        ],
      ),
    
  bottomNavigationBar: const BottomNavigation2(),
  );
  }
}