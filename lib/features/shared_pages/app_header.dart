import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared_widgets/app_fields_column.dart';

class AppHeader extends ConsumerWidget implements PreferredSizeWidget {
  const AppHeader({
    required this.title,
    this.secondaryButton,
    super.key,
  });
  final Widget? secondaryButton;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppFieldsColumn(
      marginValue: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).viewPadding.top),
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (secondaryButton != null) const Spacer(),
            if (secondaryButton != null) secondaryButton!
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(180);
}
