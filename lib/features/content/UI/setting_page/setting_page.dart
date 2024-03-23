import 'package:closer_selection/config/router/route_names.dart';
import 'package:closer_selection/features/shared_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/firebase_constants.dart';
import '../../../authentication/services/profile_provider.dart';
import '../../../shared_widgets/app_data_field.dart';
import '../../../shared_widgets/app_data_fields_column.dart';
import 'setting_header.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = fbAuth.currentUser!.uid;
    final profileState = ref.watch(profileProvider(uid));
    return profileState.when(
      data: (data) => Scaffold(
        appBar: SettingHeader(
          data: data,
          onEditProfilePressed: () {
            GoRouter.of(context).goNamed(RouteNames.editProfile);
          },
        ),
        body: ListView(
          children: [
            const SizedBox(width: 16),
            AppDataFieldsColumn(
              children: [
                AppDataField(
                  label: "Email",
                  content: data.email,
                ),
                AppDataField(
                  label: "Phone Number",
                  content: data.phoneNumber,
                ),
                AppDataField(
                  label: "Availability",
                  content: data.availability!,
                ),
              ],
            ),
            const AppTextToggleButton(label: "Visibility for Coaches"),
            const AppTextToggleButton(label: "Notification Switch"),
            AppFilledButton(
              onPressed: () {},
              text: "Application Checklist",
              margin: const EdgeInsets.all(8),
            ),
            AppFilledButton(
              onPressed: () {},
              text: "Selection criteria for good coaches",
              margin: const EdgeInsets.all(8),
            ),
            AppLogoutButton(
              onPressed: () {},
              text: "Logout",
            ),
          ],
        ),
      ),
      error: (e, st) => Text(e.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
