import 'package:closer_selection/features/shared_widgets/app_main_container.dart';
import 'package:flutter/material.dart';

class AppZipcodeField extends StatefulWidget {
  const AppZipcodeField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<AppZipcodeField> createState() => _AppZipcodeFieldState();
}

class _AppZipcodeFieldState extends State<AppZipcodeField> {
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
                return 'Zip code required';
              }
              if (value.trim().length < 5 || value.trim().length > 9) {
                return 'Phone must be between 5 and 9 characters long';
              }
              return null;
            },
            controller: widget.controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.man, color: Colors.amber),
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
