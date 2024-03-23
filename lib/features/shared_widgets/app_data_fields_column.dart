// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:closer_selection/features/shared_widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDataFieldsColumn extends StatelessWidget {
  final double borderRadiusValue;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? width;
  final VoidCallback? onPressed;
  final List<Widget> children;
  final Color? color;

  const AppDataFieldsColumn({
    super.key,
    this.onPressed,
    required this.children,
    this.borderRadiusValue = 20,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.width = double.infinity,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final radiusValue = Radius.circular(borderRadiusValue);
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(16),
      width: width,
      decoration: BoxDecoration(
        color: const Color(0x40FFFFFF),
        borderRadius: BorderRadius.all(radiusValue),
      ),
      child: Column(
        children: [
          ...children.map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  e,
                  const AppDivider(
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
      // child: ListView.separated(
      //   itemBuilder: (context, index) => children[index],
      //   separatorBuilder: (context, index) => const AppDivider(
      //     color: Colors.white,
      //   ),
      //   itemCount: children.length,
      // ),
    );
  }
}
