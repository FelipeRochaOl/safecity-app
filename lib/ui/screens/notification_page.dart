import 'package:flutter/material.dart';
import 'package:safecity/ui/components/card_notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notificações')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            AppCardNotification(
              title: 'Notification 1',
              subtitle: 'This is a notification',
            ),
            AppCardNotification(
              title: 'Notification 2',
              subtitle: 'This is another notification',
            ),
          ],
        ),
      ),
    );
  }
}
