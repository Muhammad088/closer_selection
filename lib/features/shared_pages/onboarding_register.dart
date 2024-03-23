import 'package:closer_selection/config/router/route_names.dart';
import 'package:closer_selection/features/shared_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingRegisterPage extends StatelessWidget {
  const OnboardingRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                "assets/images/onboarding.png",
                height: 300,
              ),
            ),
            const Spacer(),
            const Text(
              "Job Hunt Made Simple",
              style: TextStyle(
                height: 1.5,
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Where Careers Take Flight.",
              style: TextStyle(
                height: 1.5,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              "Aspernatur dicta excepturi minima. Nam vero quibusdam laborum. Perferendis repudiandae voluptas quia ea qui ut. Officiis magnam numquam sit voluptatem ullam aperiam.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: 1.5,
                    color: Colors.white.withOpacity(0.4),
                  ),
            ),
            const Spacer(),
            AppLogoutButton(
              onPressed: () {
                GoRouter.of(context).goNamed(RouteNames.closerRegister);
              },
              text: "Register as Closer",
            ),
            AppLogoutButton(
              onPressed: () {
                GoRouter.of(context).goNamed(RouteNames.coachRegister);
              },
              text: "Register as Entreprenuer",
            ),
            const SizedBox(height: 5),
            AppTextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(RouteNames.onboardingLogin);
              },
              text: "I already have an account.",
            ),
          ],
        ),
      ),
    );
  }
}
