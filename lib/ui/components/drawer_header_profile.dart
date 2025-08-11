import 'package:flutter/material.dart';

class DrawerHeaderProfile extends StatelessWidget {
  final String nome;
  final String email;
  final String fotoUrl;

  const DrawerHeaderProfile({
    super.key,
    required this.nome,
    required this.email,
    required this.fotoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(nome),
      accountEmail: Text(email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(fotoUrl),
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
