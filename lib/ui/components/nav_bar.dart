import 'package:flutter/material.dart';
import 'package:safecity/ui/components/tab_bar.dart';
import 'package:safecity/ui/screens/history_page.dart';
import 'package:safecity/ui/screens/report_page.dart';
import 'package:safecity/ui/styles/colors.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationHome();
  }
}

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.primaryColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add),
            icon: Icon(Icons.add_outlined),
            label: 'Reportar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.history),
            icon: Icon(Icons.history_outlined),
            label: 'Histórico',
          )
        ],
      ),
      body: <Widget>[
        /// Home page
        const TabBarHome(),

        /// Report page
        const ReportPage(),

        /// History page
        const HistoryPage(),
      ][currentPageIndex],
    );
  }
}
