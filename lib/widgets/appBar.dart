import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0), // Adjust the preferred height
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFA1CCEB),
        leading: Padding(
          padding: const EdgeInsets.only(top: 28),
          child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu,color:Color(0xFF500512)),
            ),
        ),
            
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10.0),
            
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Image.asset(
                'assets/imag.png', // Replace with your image path
                height: 85.0,
                width: 131.0,
              ),
            ),
            //const SizedBox(width: 210.0), // Add some spacing
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
