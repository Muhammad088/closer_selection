import 'package:closer_selection/features/authentication/services/update_user_provider.dart';
import 'package:closer_selection/features/shared_widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/firebase_constants.dart';
import '../../../authentication/services/profile_provider.dart';
import '../../../shared_pages/app_header.dart';
import '../../../shared_widgets/app_email_field.dart';
import '../../../shared_widgets/app_name_field.dart';
import '../../../shared_widgets/app_password_field.dart';
import '../../../shared_widgets/app_phone_field.dart';
import '../../../shared_widgets/app_selection_field.dart';
import '../../../shared_widgets/app_slider.dart';
import '../../../shared_widgets/app_zipcode_field.dart';
import '../../../shared_widgets/buttons.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();
  final TextEditingController typeOfJobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    availabilityController.dispose();
    typeOfJobController.dispose();
    phoneNumberController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void _submit(Map<String, Object> data) {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      print("form is null or not validated");
    }
    ref.read(updateUserProvider.notifier).updateUser(
          uid: fbAuth.currentUser!.uid,
          data: data,
        );
  }

  @override
  Widget build(BuildContext context) {
    final uid = fbAuth.currentUser!.uid;
    final profileState = ref.watch(profileProvider(uid));

    final updateUserState = ref.watch(updateUserProvider);
    return Scaffold(
      appBar: const AppHeader(title: "Edit Profile"),
      body: profileState.when(
        data: (data) => ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfilePhoto(radius: 25),
            AppNameField(
              label: "Full Name",
              controller: nameController,
            ),
            AppEmailField(
              label: "Email",
              controller: emailController,
            ),
            AppPhoneField(
              label: "Phone Number",
              controller: phoneNumberController,
            ),
            AppSelectionField(
              controller: availabilityController,
              label: "Availability",
              options: const ["morning", "afteroon", "night"],
            ),
            AppSelectionField(
              controller: typeOfJobController,
              label: "Type of job",
              options: const ["Commission", "Fixed Salary"],
            ),
            AppZipcodeField(
              label: "Zip code",
              controller: zipCodeController,
            ),
            const AppSlider(limit: 100, label: "Radius of work", unit: "km"),
            AppFilledButton(onPressed: () {}, text: "Edit Profile"),
          ],
        ),
        error: (e, st) => Text(e.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
