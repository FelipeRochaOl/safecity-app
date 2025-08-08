import 'package:flutter/material.dart';
import 'package:safecity/ui/screens/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Safecity extends StatelessWidget {
  const Safecity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safecity',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      home: SplashPage(),
       localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'), // ou conforme necessário
      ],
    );
  }
}
