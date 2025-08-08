import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safecity/ui/components/logo.dart';
import 'package:safecity/ui/components/primary_button.dart';
import 'package:safecity/ui/screens/login_page.dart';
import 'package:safecity/ui/styles/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backgroundColor, AppColors.primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Logo(),
                ),
                SvgPicture.asset('assets/splash.svg', fit: BoxFit.cover,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    'Proteja sua cidade e seus cidadãos',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                PrimaryButton(
                  icon: Icons.arrow_forward,
                  text: 'Começar',
                  onTap: () => _handleNavigateToLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleNavigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
