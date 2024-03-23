import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import 'app_main_container.dart';

class AppEmailField extends StatefulWidget {
  const AppEmailField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<AppEmailField> createState() => _AppEmailFieldState();
}

class _AppEmailFieldState extends State<AppEmailField> {
  bool focused = false;
  double height = 60;
  @override
  Widget build(BuildContext context) {
    return AppMainContainer(
      focused: focused,
      height: height,
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
                return 'Email required';
              }
              if (!isEmail(value.trim())) {
                return 'Enter a valid email address';
              }
              return null;
            },
            controller: widget.controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text(widget.label),
              labelStyle: const TextStyle(
                color: Color(0xFF525252),
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
