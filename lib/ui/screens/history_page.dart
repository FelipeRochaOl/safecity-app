import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: <Widget>[
          // Placeholder for history items
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Example count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Histórico Item ${index + 1}'),
                  subtitle: Text('Detalhes do item ${index + 1}'),
                  leading: Icon(Icons.history),
                  trailing: Icon(Icons.arrow_forward),
                  style: ListTileStyle.drawer,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
