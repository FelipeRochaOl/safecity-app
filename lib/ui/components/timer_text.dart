import 'package:flutter/material.dart';

class AppTimerText extends StatelessWidget {
  final String dateTime;
  const AppTimerText({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.access_time, size: 16.0),
        SizedBox(width: 4.0),
        Text("Data e Hora: $dateTime"),
      ],
    );
  }
}
