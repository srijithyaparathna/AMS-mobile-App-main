import 'package:appointmentms/pages/homepage.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:flutter/material.dart';

class SetPhoto extends StatefulWidget {
  const SetPhoto({Key? key}) : super(key: key);

  @override
  State<SetPhoto> createState() => _SetPhotoState();
}

class _SetPhotoState extends State<SetPhoto> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
  onTap: () {
    // Call the function to show the menu when the avatar is tapped
    _showMenu(context);
  },
  child:  CircleAvatar(
    radius: 20,
    backgroundImage: AssetImage('assets/Avatar.png'),
  ),
)
      ],
    );
  }
}

void _showMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 100, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          value: 'Logout',
          child:  AppLargeText3(text: "Log out"), // You can customize the appearance here
        ),
        
      ],
    );

    if (result != null) {
    if (result == 'Logout') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  HomePage(), 
        ),
      );
    } 
    
    }
}
