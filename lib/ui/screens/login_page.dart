import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safecity/core/service/api_service.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/elevated_button.dart';
import 'package:safecity/ui/components/input.dart';
import 'package:safecity/ui/components/logo.dart';
import 'package:safecity/ui/screens/register_page.dart';
import 'package:safecity/ui/screens/valid_page.dart';
import 'package:safecity/ui/styles/fonts.dart';
import 'package:safecity/ui/styles/spaces.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundPage(),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 120.0),
                      child: Logo(iconHeight: 26, textSize: 26),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      children: [
                        Text(
                          'Bem vindo!',
                          style: TextStyle(fontSize: AppFonts.headingFontSize),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Login ou',
                          style: TextStyle(fontSize: AppFonts.bodyFontSize),
                        ),
                        const SizedBox(width: 5),
                        TextButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            animationDuration: const Duration(
                              milliseconds: 300,
                            ),
                          ),
                          onPressed: () => _handleNavigateToRegister(context),
                          child: const Text(
                            'criar uma conta',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    AppInput(
                      label: 'Email',
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    AppInput(
                      label: 'Senha',
                      isPassword: true,
                      controller: _passCtrl,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: AppElevatedButton(
                    onPressed: _loading ? null : () => _handleOpen(context),
                    text: _loading ? 'Entrando...' : 'Entrar',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleOpen(BuildContext context) async {
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Preencha email e senha')));
      return;
    }

    setState(() => _loading = true);
    try {
      await ApiService.login(email, password);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ValidPage()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro no login: $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _handleNavigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterPage()),
    );
  }
}
