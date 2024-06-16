import 'package:flutter/material.dart';

class AppointmentItem extends StatelessWidget {
  final Map<String, dynamic> appointment;

  const AppointmentItem({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${appointment['name'] ?? 'N/A'}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
             Text('name : ${appointment['name'] ?? '' }' ),
            Text('Batch: ${appointment['batch'] ?? 'N/A'}'),
            Text('Subject: ${appointment['subject'] ?? 'N/A'}'),
            Text('Description: ${appointment['description'] ?? 'N/A'}'),
            Text('ID: ${appointment['id'] ?? 'N/A'}'),
            Text('Date: ${appointment['date'] ?? 'N/A'}'),
            Text('Start Time: ${appointment['startTime'] ?? 'N/A'}'),
            Text('End Time: ${appointment['endTime'] ?? 'N/A'}'),
            Text('Status: ${appointment['status'] ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
