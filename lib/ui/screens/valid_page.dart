import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/primary_button.dart';
import 'package:safecity/ui/screens/home_page.dart';
import 'package:safecity/ui/screens/login_page.dart';
import 'package:safecity/ui/styles/colors.dart';
import 'package:safecity/ui/styles/fonts.dart';

class ValidPage extends StatelessWidget {
  final String phoneNumber;
  const ValidPage({super.key, this.phoneNumber = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _handleNavigateToLogin(context),
        ),
        title: Text('Verifique sua conta'),
      ),
      body: Stack(
        children: [
          BackgroundPage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Entre com o 4 dígitos enviados para o seu telefone via ****$phoneNumber.",
                      style: TextStyle(
                        fontSize: AppFonts.bodyFontSize,
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: AppColors.primaryColor,
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.visiblePassword,
                      animationType: AnimationType.fade,
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: AppColors.textColor,
                      ),
                      onChanged: (value) {
                        // valor atual
                      },
                      onCompleted: (value) {
                        print("Código digitado: $value");
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 48,
                        fieldWidth: 48,
                        fieldOuterPadding: EdgeInsets.all(10.0),
                        selectedColor: AppColors.primaryColor,
                        errorBorderColor: AppColors.errorColor,
                        inactiveColor: Colors.grey,
                        activeColor: AppColors.secondColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        onTap: () => _handleHomePage(context),
                        text: 'Verificar',
                      ),
                      SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          // Ação ao pressionar o botão de solicitar novo código
                        },
                        child: Text(
                          'Solicitar novo código',
                          style: TextStyle(
                            color: AppColors.textColor,
                            decoration: TextDecoration.underline,
                            fontSize: AppFonts.bodyFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  _handleNavigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
