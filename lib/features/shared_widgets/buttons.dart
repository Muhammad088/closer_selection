// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final String text;
  final Color? color;

  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.margin = const EdgeInsets.symmetric(vertical: 4.0),
    this.width = double.infinity,
    this.height = 48.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(8);
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color != null
              ? [color!, color!]
              : [
                  const Color.fromARGB(255, 255, 112, 46),
                  const Color.fromARGB(255, 255, 200, 0),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 1.5,
                color: const Color(0xFF202020),
              ),
        ),
      ),
    );
  }
}

class AppLogoutButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final Color? color;

  const AppLogoutButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.width = double.infinity,
    this.height = 48.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(8);
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 1.5,
                color: const Color(0xFF202020),
              ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;

  const AppTextButton({
    super.key,
    required this.onPressed,
    this.textColor = const Color(0x80FFFFFF),
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}

class AppTextToggleButton extends StatefulWidget {
  const AppTextToggleButton({
    super.key,
    this.onTapped,
    this.textColor,
    required this.label,
  });

  final String label;
  final Function()? onTapped;
  final Color? textColor;

  @override
  State<AppTextToggleButton> createState() => _AppTextToggleButtonState();
}

class _AppTextToggleButtonState extends State<AppTextToggleButton> {
  bool switchValue = false;
  void switchOnOff(value) {
    setState(() {
      switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switchOnOff(!switchValue);
      },
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0x40ffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: widget.textColor ?? Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const Expanded(child: SizedBox()),
            Switch(
                value: switchValue,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white,
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                onChanged: (v) {
                  switchOnOff(v);
                }),
          ],
        ),
      ),
    );
  }
}
