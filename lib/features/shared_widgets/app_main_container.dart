// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppMainContainer extends StatelessWidget {
  const AppMainContainer({
    super.key,
    this.focused = false,
    this.height,
    required this.child,
  });

  final bool focused;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.only(top: 8, right: 16),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 62, 62, 62),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: focused
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
      ),
      child: child,
    );
  }
}
