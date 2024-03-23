import 'package:flutter/material.dart';

import 'app_main_container.dart';

class AppSelectionField extends StatefulWidget {
  const AppSelectionField({
    super.key,
    required this.label,
    required this.options,
    required this.controller,
  });
  final String label;
  final List<String> options;

  final TextEditingController controller;

  @override
  State<AppSelectionField> createState() => _AppSelectionFieldState();
}

class _AppSelectionFieldState extends State<AppSelectionField> {
  bool focused = false;
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return AppMainContainer(
        focused: focused,
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: widget.controller,
                decoration: InputDecoration(
                  label: Text(widget.label),
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 152, 152, 152),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: widget.options
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.controller.text = newValue ?? "select";
                  });
                },
              ),
            ),
          ],
        ));
  }
}
