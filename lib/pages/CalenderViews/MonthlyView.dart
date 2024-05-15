import 'package:appointmentms/pages/CalenderViews/DailyView.dart';
import 'package:appointmentms/widgets/SideBar.dart';
import 'package:appointmentms/widgets/appBar.dart';
import 'package:appointmentms/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class MonthlyView extends StatefulWidget {
  const MonthlyView({Key? key}) : super(key: key);

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView> {
  late DateTime _selectedDate; // Track the selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SfCalendar(
            view: CalendarView.month,
	               allowViewNavigation: true,
                 timeSlotViewSettings: const TimeSlotViewSettings(
                  timeInterval: Duration(minutes: 30),
                  timeIntervalWidth: 60,
                  timeFormat: 'h:mm a',
                  timeRulerSize: 80,
                  timeTextStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  void _navigateToDailyView(BuildContext context, DateTime selectedDate) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DailyView(selectedDate: selectedDate),
      ),
    );
  }
}
