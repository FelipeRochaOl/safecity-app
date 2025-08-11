import 'package:flutter/material.dart';
import 'package:safecity/ui/components/map_screen.dart';
import 'package:safecity/ui/components/report_list.dart';

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
                    MapScreen(),
                    IncidentListScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}