// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OtherLoginMethods extends StatelessWidget {
  const OtherLoginMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LoginMethodItem(
          onTap: () {
            // todo: implement google login
          },
          image: "assets/logos/google.png",
        ),
        LoginMethodItem(
          onTap: () {
            // todo: implement facebook login
          },
          image: "assets/logos/facebook.png",
        ),
        LoginMethodItem(
          onTap: () {
            // todo: implement apple login
          },
          image: "assets/logos/apple.png",
        ),
      ],
    );
  }
}

class LoginMethodItem extends StatelessWidget {
  const LoginMethodItem({
    super.key,
    required this.onTap,
    required this.image,
  });
  final Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Image.asset(image),
      ),
    );
  }
}
