// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppFieldsColumn extends StatelessWidget {
  final double borderRadiusValue;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? width;
  final double marginValue;
  final VoidCallback? onPressed;
  final List<Widget> children;
  final Color? color;

  const AppFieldsColumn({
    super.key,
    this.onPressed,
    required this.children,
    this.borderRadiusValue = 20,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.width = double.infinity,
    this.marginValue = 8,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final radiusValue = Radius.circular(borderRadiusValue);
    return Container(
      margin: EdgeInsets.all(marginValue),
      padding: const EdgeInsets.all(12.0),
      width: width,
      decoration: BoxDecoration(
        color: const Color(0x40FFFFFF),
        borderRadius: BorderRadius.only(
          bottomRight: radiusValue,
          bottomLeft: radiusValue,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
