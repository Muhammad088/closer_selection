import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/route_names.dart';
import 'app_main_container.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
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
              if (value == null || value.trim().length < 4) {
                return 'type at least 4 characters to start searching';
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
                color: Color(0xFF525252),
              ),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () async {
                  GoRouter.of(context).goNamed(RouteNames.filter);
                },
                icon: const Icon(Icons.tune, color: Colors.amber),
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
