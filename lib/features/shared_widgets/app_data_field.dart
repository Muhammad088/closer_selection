import 'package:flutter/material.dart';

class AppDataField extends StatefulWidget {
  const AppDataField({
    super.key,
    required this.label,
    required this.content,
  });
  final String label;
  final String content;

  @override
  State<AppDataField> createState() => _AppDataFieldState();
}

class _AppDataFieldState extends State<AppDataField> {
  bool focused = false;
  double height = 60;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: Color.fromARGB(255, 147, 146, 146),
              fontSize: 12,
            ),
          ),
          Text(
            widget.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
