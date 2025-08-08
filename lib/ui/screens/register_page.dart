import 'package:flutter/material.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/elevated_button.dart';
import 'package:safecity/ui/components/input.dart';
import 'package:safecity/ui/screens/valid_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar uma conta')),
      body: Stack(
        children: [
          BackgroundPage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Criar uma conta',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    AppInput(label: 'Nome'),
                    SizedBox(height: 20),
                    AppInput(label: 'Email'),
                    SizedBox(height: 20),
                    AppInput(label: 'Password', isPassword: true),
                    SizedBox(height: 20),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: AppElevatedButton(
                    onPressed: () => _handleRegister(context),
                    text: 'Registrar',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleRegister(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ValidPage(phoneNumber: "0709",)),
    );
  }
}
