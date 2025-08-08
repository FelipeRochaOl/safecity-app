import 'package:flutter/material.dart';
import 'package:safecity/ui/styles/colors.dart';

class Logo extends StatelessWidget {
  final double iconHeight;
  final double textSize;
  const Logo({super.key, this.iconHeight = 50.0, this.textSize = 32.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/security-icon.png', height: iconHeight),
        const SizedBox(width: 8),
        Text(
          'Safecity',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
