import 'package:closer_selection/features/shared_widgets/app_fields_column.dart';
import 'package:closer_selection/features/shared_widgets/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/constants/firebase_constants.dart';
import '../../../../authentication/services/profile_provider.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = fbAuth.currentUser!.uid;
    final profileState = ref.watch(profileProvider(uid));

    return AppFieldsColumn(
      marginValue: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: profileState.maybeWhen(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, ${data.type}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      data.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        AppSearchField(
          label: "search",
          controller: searchController,
        ),
      ],
    );
  }
}
