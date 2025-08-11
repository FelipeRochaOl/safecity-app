import 'package:flutter/material.dart';
import 'package:safecity/ui/components/card_report.dart';

class IncidentListScreen extends StatelessWidget {
  const IncidentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return AppCardReport(
          key: Key('report_$index'),
          dateTime: '08/08/2025 20:58',
          title: 'Assalto',
          description: 'Assalto avenida paulista, com 2 mortos!',
        );
      },
    );
  }
}
