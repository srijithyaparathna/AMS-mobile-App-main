import 'package:appointmentms/widgets/SetPhoto.dart';
import 'package:flutter/material.dart';

class AfterLoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AfterLoginAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0), // Adjust the preferred height
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFA1CCEB),
        /*leading: Padding(
          padding: const EdgeInsets.only(top: 28),
          child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              //icon: Icon(Icons.menu,color:Color(0xFF500512)),
            ),
        ),*/
            
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5.0),
            
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Image.asset(
                'assets/imag.png', // Replace with your image path
                height: 85.0,
                width: 131.0,
              ),
            ),
            SizedBox(width: 170,),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SetPhoto(),
            ),
            SizedBox(width: 20,)
            //const SizedBox(width: 210.0), // Add some spacing
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
