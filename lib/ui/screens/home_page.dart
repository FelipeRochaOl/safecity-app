import 'package:flutter/material.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/drawer_header_profile.dart';
import 'package:safecity/ui/components/nav_bar.dart';
import 'package:safecity/ui/screens/login_page.dart';
import 'package:safecity/ui/screens/notification_page.dart';
import 'package:safecity/ui/screens/setting_page.dart';
import 'package:safecity/ui/styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.backgroundColor,
        child: Column(
          children: [
            DrawerHeaderProfile(
              nome: "Felipe Rocha",
              email: "felipe@email.com",
              fotoUrl: "https://i.pravatar.cc/150?img=3",
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                _handleNavigateToLogin(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu), // menu burger
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Image.asset('assets/security-icon.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => _handleNavigateToNotifications(context),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _handleNavigateToSettings(context),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [BackgroundPage(), NavigationBarApp()],
      ),
    );
  }

  _handleNavigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  _handleNavigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  _handleNavigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }
}
