import 'package:flutter/material.dart';

class AppTimeInput extends StatefulWidget {
  final String label;
  final TimeOfDay? initialTime;
  final Function(TimeOfDay) onTimeSelected;
  final String? initialText;
  final FormFieldValidator<String>? validator;

  const AppTimeInput({
    super.key,
    required this.label,
    required this.onTimeSelected,
    this.initialTime,
    this.initialText,
    this.validator,
  });

  @override
  State<AppTimeInput> createState() => _AppTimeInputState();
}

class _AppTimeInputState extends State<AppTimeInput> {
  late TextEditingController _controller;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText ?? '');
    _selectedTime = widget.initialTime;
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _controller.text = _formatTime(picked);
      });
      widget.onTimeSelected(picked);
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: _pickTime,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: Icon(Icons.access_time),
        border: OutlineInputBorder(),
      ),
    );
  }
}
