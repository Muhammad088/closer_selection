// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.title,
    this.color = Colors.black45,
    this.fontSize = 14,
    this.fontWeight = FontWeight.bold,
  });
  final String? title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
          ),
        ),
        title != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: color,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Expanded(
          child: Divider(
            color: color,
          ),
        ),
      ],
    );
  }
}
