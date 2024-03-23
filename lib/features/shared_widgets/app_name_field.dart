import 'package:flutter/material.dart';

import 'app_main_container.dart';

class AppNameField extends StatefulWidget {
  const AppNameField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<AppNameField> createState() => _AppNameFieldState();
}

class _AppNameFieldState extends State<AppNameField> {
  bool focused = false;
  double height = 60;
  @override
  Widget build(BuildContext context) {
    return AppMainContainer(
      height: height,
      focused: focused,
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) {
            setState(() {
              focused = focus;
            });
          },
          child: TextFormField(
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name required';
              }
              if (value.trim().length < 2 || value.trim().length > 12) {
                return 'Name must be between 2 and 12 characters long';
              }
              return null;
            },
            controller: widget.controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.text,
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
      ),
    );
  }
}
