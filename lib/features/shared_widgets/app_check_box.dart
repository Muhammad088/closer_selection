import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({super.key, required this.label});
  final String label;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
            checkColor: Colors.black,
          ),
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
