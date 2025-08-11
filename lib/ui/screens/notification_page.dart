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
              title: 'Assalto',
              subtitle: 'Assalto avenida paulista, com 2 mortos!',
            ),
          ],
        ),
      ),
    );
  }
}
