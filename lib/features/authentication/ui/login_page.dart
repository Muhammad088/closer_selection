// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_names.dart';
import '../../../utils/errors/custom_error.dart';
import '../../../utils/errors/error_dialog.dart';
import '../../shared_widgets/app_check_box.dart';
import '../../shared_widgets/app_divider.dart';
import '../../shared_widgets/app_email_field.dart';
import '../../shared_widgets/app_password_field.dart';
import '../../shared_widgets/app_title_logo.dart';
import '../../shared_widgets/buttons.dart';
import '../../shared_widgets/app_fields_column.dart';
import '../../shared_widgets/other_login_methods.dart';
import '../services/login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CloserLoginPageState();
}

class _CloserLoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    ref.read(loginProvider.notifier).login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      loginProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, st) => errorDialog(
            context,
            error as CustomError,
          ),
        );
      },
    );

    final loginState = ref.watch(loginProvider);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AppTitleLogo(),
            Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: AppFieldsColumn(
                onPressed: null,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "Enter following details to continue.",
                    style: TextStyle(
                      color: Color(0x80FFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppEmailField(
                    label: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  AppPasswordField(
                    label: "Password",
                    controller: passwordController,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const AppCheckbox(label: "Remember Me"),
                      const Spacer(),
                      AppTextButton(
                        onPressed: () {
                          // todo: implement forget password here
                        },
                        text: "Forget Password?",
                        textColor: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  AppLogoutButton(
                    onPressed: loginState.maybeWhen(
                      loading: () => null,
                      orElse: () => _submit,
                    ),
                    text: "Login",
                  ),
                  const SizedBox(height: 10),
                  const AppDivider(title: "OR"),
                  const SizedBox(height: 10),
                  const OtherLoginMethods(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            AppTextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(RouteNames.onboardingRegister);
              },
              text: "I don't have any account",
              // textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
