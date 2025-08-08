import 'package:flutter/material.dart';
import 'package:safecity/core/config/settings.dart';
import 'package:safecity/ui/components/setting_card.dart';
import 'package:safecity/ui/screens/login_page.dart';
import 'package:safecity/ui/screens/notification_config_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              SettingGroupCard(
                header: 'Geral',
                children: [
                  SettingTile(
                    icon: Icons.display_settings, 
                    title: 'Tela',
                    onTap: () => openDisplaySettings(),
                  ),
                  SettingTile(
                    icon: Icons.volume_up, 
                    title: 'Som',
                    onTap: () => openSoundSettings(),
                  ),
                  SettingTile(
                    icon: Icons.tune, 
                    title: 'Avançado',
                    onTap: () => openAdvancedSettings(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SettingGroupCard(
                header: 'Account',
                children: [
                  SettingTile(
                    icon: Icons.account_circle_outlined, 
                    title: 'Conta',
                    onTap: () => openAccountSettings(),
                  ),
                  SettingTile(
                    icon: Icons.notifications_none,
                    title: 'Notificações',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const NotificationsConfigPage()),
                    ),
                  ),
                  SettingTile(
                    icon: Icons.logout, 
                    title: 'Sair',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
