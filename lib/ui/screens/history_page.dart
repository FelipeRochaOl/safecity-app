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
              itemCount: 1, // Example count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Assalto - 08/08/2025 20:58'),
                  subtitle: Text('Assalto avenida paulista, com 2 mortos!'),
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
