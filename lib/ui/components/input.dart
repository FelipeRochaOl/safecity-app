import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String label;
  final bool isPassword;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  const AppInput({
    super.key,
    required this.label,
    this.isPassword = false,
    this.borderRadius = 8.0,
    this.borderWidth = 0.1,
    this.borderColor = Colors.deepPurple,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
