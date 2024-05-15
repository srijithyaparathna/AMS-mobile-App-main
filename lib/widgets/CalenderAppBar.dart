
import 'package:appointmentms/widgets/SetPhoto.dart';
import 'package:appointmentms/widgets/icondropdown.dart';
import 'package:appointmentms/widgets/texboxLec.dart';
import 'package:flutter/material.dart';

class CalenderAPPBar extends StatelessWidget implements PreferredSizeWidget {
  const CalenderAPPBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AppBar(
        backgroundColor: const Color(0xFFA1CCEB),
        leading: Padding(
      padding: const EdgeInsets.only(left: 4.0,top: 28),  
        ),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Icon(Icons.menu, color:Color(0xFF500512)),
                
              ),
            ),
            const SizedBox(width: 15.0),
            TextBox(labelText: "Month", width: 100, height: 30),
            //IconDropCalender(),
            const SizedBox(width: 50.0),
            Icon(Icons.search, color:Color(0xFF500512)),
            const SizedBox(width: 50.0),
            SetPhoto(),
            
          ],
        ),
      ),
    );
  }
}
