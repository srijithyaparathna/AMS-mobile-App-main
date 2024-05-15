import 'package:flutter/material.dart';

class AppBarcommon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarcommon({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFA1CCEB),
      leading: Padding(
    padding: const EdgeInsets.only(left: 4.0,top: 28), // Adjust the left padding as needed
    /*child: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // Handle back button press
        Navigator.pop(context);
      },
    ),*/
  ),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            padding: const EdgeInsets.only(top: 30, left: 15),
            child: Image.asset(
              'assets/imag.png', // Replace with your image path
              height: 85.0,
              width: 131.0,
            ),
          ),
          const SizedBox(width: 190.0), // Add some spacing
        ],
      ),
    );
  }
}
