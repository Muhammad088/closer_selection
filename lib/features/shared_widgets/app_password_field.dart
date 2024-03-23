import 'package:closer_selection/features/shared_widgets/app_main_container.dart';
import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool focused = false;
  bool visible = false;
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
            obscureText: !visible,
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password required';
              }
              if (value.trim().length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
            controller: widget.controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              ),
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
