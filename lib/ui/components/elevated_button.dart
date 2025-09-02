import 'package:flutter/material.dart';
import 'package:safecity/ui/styles/colors.dart';
import 'package:safecity/ui/styles/fonts.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final bool beforeIcon;
  final bool afterIcon;
  final Color backgroundColor;
  final Color textColor;
  final MainAxisAlignment alignment;

  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.beforeIcon = false,
    this.afterIcon = false,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.textColor,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed!(),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            if (icon != null && beforeIcon) Icon(icon, color: textColor),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: AppFonts.buttonFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null && afterIcon) Icon(icon, color: textColor),
          ],
        ),
      ),
    );
  }
}
