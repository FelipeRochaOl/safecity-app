import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/elevated_button.dart';
import 'package:safecity/ui/components/input.dart';
import 'package:safecity/ui/components/logo.dart';
import 'package:safecity/ui/screens/register_page.dart';
import 'package:safecity/ui/screens/valid_page.dart';
import 'package:safecity/ui/styles/fonts.dart';
import 'package:safecity/ui/styles/spaces.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundPage(),
          Positioned(
            bottom: 0,
            left: 0,
            child: Opacity(
              opacity: 0.3,
              child: SvgPicture.asset(
                'assets/login.svg',
                width: 400,
                height: 400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpaces.border),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Logo(iconHeight: 26, textSize: 26),
                    ),
                    SizedBox(height: 100),
                    Row(
                      children: [
                        Text(
                          'Bem vindo!',
                          style: TextStyle(fontSize: AppFonts.headingFontSize),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      spacing: 0,
                      children: [
                        Text(
                          'Login ou',
                          style: TextStyle(fontSize: AppFonts.bodyFontSize),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            animationDuration: Duration(milliseconds: 300),
                          ),
                          onPressed: () => _handleNavigateToRegister(context),
                          child: Text(
                            'criar uma conta',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    AppInput(label: 'Email'),
                    SizedBox(height: 20),
                    AppInput(label: 'Senha', isPassword: true),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: AppElevatedButton(onPressed: () => _handleOpen(context), text: 'Entrar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleOpen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ValidPage()),
    );
  }

  _handleNavigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }
}
