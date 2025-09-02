import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String label;
  final bool isPassword;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  // 🔽 novos parâmetros (opcionais)
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;

  const AppInput({
    super.key,
    required this.label,
    this.isPassword = false,
    this.borderRadius = 8.0,
    this.borderWidth = 0.1,
    this.borderColor = Colors.deepPurple,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // 🔽 passa o controller
      onChanged: onChanged, // 🔽 passa o onChanged
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            width: borderWidth,
            style: BorderStyle.solid,
            color: borderColor,
          ),
        ),
        labelText: label,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            width: borderWidth,
            style: BorderStyle.solid,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
