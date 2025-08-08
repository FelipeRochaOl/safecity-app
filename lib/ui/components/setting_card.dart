import 'package:flutter/material.dart';

class SettingGroupCard extends StatelessWidget {
  final String? header;
  final List<Widget> children;
  const SettingGroupCard({super.key, this.header, required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(header!, style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor)),
          ),
        ],
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i != children.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const SettingTile({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        dense: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
