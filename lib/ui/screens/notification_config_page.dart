import 'package:flutter/material.dart';

class NotificationsConfigPage extends StatefulWidget {
  const NotificationsConfigPage({super.key});

  @override
  State<NotificationsConfigPage> createState() => _NotificationsConfigPageState();
}

class _NotificationsConfigPageState extends State<NotificationsConfigPage> {
  bool showBadge = false;
  bool pushLikes = true;
  bool pushFollowers = false;
  bool emailLikes = false;
  bool emailFollowers = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Switch principal com descrição
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Notificações', style: theme.textTheme.titleMedium),
                            const SizedBox(height: 4),
                            Text(
                              'Exibir um emblema com o número de notificações não lidas',
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: showBadge,
                        onChanged: (v) => setState(() => showBadge = v),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Push notifications
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: Text('Push notifications', style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor)),
              ),
              Card(
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: pushLikes,
                      onChanged: (v) => setState(() => pushLikes = v ?? false),
                      title: const Text('Likes'),
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    const Divider(height: 1),
                    CheckboxListTile(
                      value: pushFollowers,
                      onChanged: (v) => setState(() => pushFollowers = v ?? false),
                      title: const Text('Seguidores'),
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Email notifications
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: Text('Notificações por Email', style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor)),
              ),
              Card(
                child: Column(
                  children: [
                    // Linha "Likes" com caixa à direita (como no mock)
                    ListTile(
                      title: const Text('Likes'),
                      trailing: Checkbox(
                        value: emailLikes,
                        onChanged: (v) => setState(() => emailLikes = v ?? false),
                      ),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: const Text('Seguidores'),
                      trailing: Checkbox(
                        value: emailFollowers,
                        onChanged: (v) => setState(() => emailFollowers = v ?? false),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
