import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius - 1,
        child: ClipOval(
            child: Image.asset(
          "assets/images/onboarding.png",
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
