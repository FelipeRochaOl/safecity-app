import 'package:flutter/material.dart';
import 'package:safecity/ui/styles/colors.dart';
import 'package:safecity/ui/styles/fonts.dart';

class SwitchApp extends StatefulWidget {
  final bool isChecked;
  final String label;

  const SwitchApp({super.key, this.isChecked = false, this.label = ''});

  @override
  State<SwitchApp> createState() => _SwitchAppState();
}

class _SwitchAppState extends State<SwitchApp> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: _currentValue,
          activeColor: AppColors.textColor,
          onChanged: (bool value) {
            setState(() {
              _currentValue = value;
            });
          },
        ),
        const SizedBox(width: 8.0),
        Text(
          widget.label,
          style: TextStyle(
            color: _currentValue ? AppColors.textColor : Colors.grey,
            fontSize: AppFonts.bodyFontSize,
          ),
        ),
      ],
    );
  }
}