import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_names.dart';
import '../../../utils/errors/custom_error.dart';
import '../../../utils/errors/error_dialog.dart';
import '../../shared_widgets/app_check_box.dart';
import '../../shared_widgets/app_email_field.dart';
import '../../shared_widgets/app_name_field.dart';
import '../../shared_widgets/app_password_field.dart';
import '../../shared_widgets/app_phone_field.dart';
import '../../shared_widgets/app_selection_field.dart';
import '../../shared_widgets/app_slider.dart';
import '../../shared_widgets/app_title_logo.dart';
import '../../shared_widgets/app_zipcode_field.dart';
import '../../shared_widgets/buttons.dart';
import '../../shared_widgets/app_fields_column.dart';
import '../services/register_provider.dart';

class CoachRegisterPage extends ConsumerStatefulWidget {
  const CoachRegisterPage({super.key});

  @override
  ConsumerState<CoachRegisterPage> createState() => _CoachRegisterPageState();
}

class _CoachRegisterPageState extends ConsumerState<CoachRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController typeOfJobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    typeOfJobController.dispose();
    phoneNumberController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      print("form is null or not validated");
    }
    ref.read(registerProvider.notifier).register(
          email: emailController.text.trim(),
          name: nameController.text.trim(),
          type: "coach",
          password: passwordController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          typeOfJob: typeOfJobController.text.trim(),
          zipCode: zipCodeController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      registerProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, st) => errorDialog(
            context,
            error as CustomError,
          ),
        );
      },
    );

    final registerState = ref.watch(registerProvider);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const AppTitleLogo(),
            Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: AppFieldsColumn(
                onPressed: null,
                children: [
                  const Text(
                    "Welcome to Coach",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "Register as a new member of coach.",
                    style: TextStyle(
                      color: Color(0x80FFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  // todo: upload image
                  const SizedBox(height: 5),

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
                  AppPasswordField(
                    label: "Password",
                    controller: passwordController,
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
                  const AppSlider(
                      limit: 100, label: "Radius of work", unit: "km"),
                  const AppCheckbox(
                      label: "I hereby accept the privacy Policy"),
                  const SizedBox(height: 5),
                  AppLogoutButton(
                    onPressed: registerState.maybeWhen(
                      loading: () => null,
                      orElse: () => _submit,
                    ),
                    text: registerState.maybeWhen(
                      loading: () => "submitting ...",
                      orElse: () => "register",
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            AppTextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(RouteNames.login);
              },
              text: "I already have a coach account",
              // textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
