import 'package:closer_selection/features/authentication/models/app_user.dart';
import 'package:flutter/material.dart';

import '../../../shared_widgets/profile_photo.dart';

class SettingHeader extends StatelessWidget implements PreferredSizeWidget {
  const SettingHeader(
      {super.key, required this.onEditProfilePressed, required this.data});
  final Function() onEditProfilePressed;
  final AppUser data;

  @override
  Widget build(BuildContext context) {
    double radius = 50;
    double height = 150;
    const radiusValue = Radius.circular(20);
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).viewPadding.top),
        Stack(
          children: [
            Container(
              height: height - radius,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Color(0x40FFFFFF),
                borderRadius: BorderRadius.only(
                  bottomRight: radiusValue,
                  bottomLeft: radiusValue,
                ),
              ),
            ),
            Container(
              height: height,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "My Profile",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 2,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: onEditProfilePressed,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF212121),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Edit Profile",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 2,
                                  fontSize: 10,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ProfilePhoto(radius: radius),
            )
          ],
        ),
        Text(
          data.name.toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.type.toUpperCase(),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.verified_rounded, color: Colors.blueAccent),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(220);
}
