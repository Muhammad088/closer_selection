import 'package:flutter/material.dart';

import 'app_main_container.dart';

class AppPhoneField extends StatefulWidget {
  const AppPhoneField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<AppPhoneField> createState() => _AppPhoneFieldState();
}

class _AppPhoneFieldState extends State<AppPhoneField> {
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
                return 'Phone required';
              }
              if (value.trim().length < 9 || value.trim().length > 15) {
                return 'Phone must be between 9 and 15 characters long';
              }
              return null;
            },
            controller: widget.controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.phone,
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
