import 'package:flutter/material.dart';

class AppCardNotification extends StatelessWidget {
  final String title;
  final String subtitle;
  const AppCardNotification({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.notifications_sharp),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
