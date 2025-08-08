import 'package:flutter/material.dart';
import 'package:safecity/ui/styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: icon != null ? 8.0 : 0),
            icon != null ? Icon(icon, color: AppColors.textColor, size: 16.0,) : Container(),
          ],
        ),
      ),
    );
  }
}
