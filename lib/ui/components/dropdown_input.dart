import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final String label;
  final List<String> options;
  const AppDropdown({super.key, required this.label, this.options = const []});

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  late String _label; 
  late String? _selectedOption;
  late List<String> _options;

  @override
  void initState() {
    super.initState();
    _label = widget.label;
    _selectedOption = widget.options.isNotEmpty ? widget.options[0] : '';
    _options = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: Text(_label),
      decoration: InputDecoration(
        labelText: 'Selecione uma opção',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      value: _selectedOption,
      items: _options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Selecione uma opção válida';
        }
        return null;
      },
    );
  }
}
