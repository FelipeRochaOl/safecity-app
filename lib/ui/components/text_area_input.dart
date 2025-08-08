import 'package:flutter/material.dart';

class AppTextArea extends StatelessWidget {
  final String label;
  final String? initialValue;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const AppTextArea({
    super.key,
    required this.label,
    this.initialValue,
    this.maxLines = 5,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        alignLabelWithHint: true,
      ),
    );
  }
}
