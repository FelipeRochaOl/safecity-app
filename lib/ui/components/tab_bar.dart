import 'package:flutter/material.dart';
import 'package:safecity/ui/components/card_report.dart';

class TabBarHome extends StatelessWidget {
  const TabBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Colors.transparent,
                child: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.map), text: "Mapa",),
                    Tab(icon: Icon(Icons.list), text: "Lista de incidentes",),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Icon(Icons.directions_car),
                    ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return AppCardReport(
                          key: Key('report_$index'),
                          dateTime: '01/01/2023 12:00',
                          title: 'Incidente $index',
                          description: 'Descrição do incidente relatado.',
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}