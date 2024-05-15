import 'package:flutter/material.dart';

class IconDropDown extends StatefulWidget {
  const IconDropDown({super.key});

  @override
  State<IconDropDown> createState() => _IconDropDownState();
}

class _IconDropDownState extends State<IconDropDown> {
  late String valueChoose;

  // Initialize valueChoose in the initState
  @override
  void initState() {
    super.initState();
    valueChoose = " DEIE"; // Initialize with a default value
  }

  List<String> listItem = [" DEIE", " CEE", " DMME", " IS"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFD3E3E9),
              borderRadius: BorderRadius.circular(3),
            ),
            child: DropdownButton<String>(
              hint: Text("hello"),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue!;
                });
              },
              style: TextStyle(color: Color(0xFF500512)),
              dropdownColor: Color(0xFFD3E3E9),
              underline: Container(),
              items: listItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
