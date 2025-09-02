import 'package:flutter/material.dart';
import 'package:safecity/core/service/api_service.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/elevated_button.dart';
import 'package:safecity/ui/components/input.dart';
import 'package:safecity/ui/screens/valid_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar uma conta')),
      body: Stack(
        children: [
          const BackgroundPage(),
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
                    const SizedBox(height: 8),
                    const Text(
                      'Criar uma conta',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 🔽 Passe os controllers para os inputs
                    AppInput(
                      label: 'Nome',
                      controller: _nameCtrl,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),

                    AppInput(
                      label: 'Email',
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),

                    AppInput(
                      label: 'Password',
                      isPassword: true,
                      controller: _passCtrl,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),

                    AppInput(
                      label: 'Telefone',
                      controller: _phoneCtrl,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: AppElevatedButton(
                    onPressed: _loading
                        ? null
                        : _handleRegister, // callback, não chame direto
                    text: _loading ? 'Registrando...' : 'Registrar',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleRegister() async {
    final name = _nameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text;
    final phoneRaw = _phoneCtrl.text;
    final phone = phoneRaw.replaceAll(RegExp(r'\D'), ''); // mantém só dígitos

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha nome, email e senha')),
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await ApiService.register(name, email, password, phone);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ValidPage(phoneNumber: phone), // use o telefone digitado
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro no cadastro: $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }
}
