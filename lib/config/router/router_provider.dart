import 'package:closer_selection/features/shared_pages/onboarding_login.dart';
import 'package:closer_selection/features/shared_pages/onboarding_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/content/UI/setting_page/edit_profile_page.dart';
import '../../features/authentication/ui/closer_register_page.dart';
import '../../features/content/UI/setting_page/setting_page.dart';
import '../../features/authentication/repositories/auth_repository/auth_repository_provider.dart';
import '../../features/authentication/ui/login_page.dart';
import '../../features/authentication/ui/coach_edit_profile_page.dart';
import '../../features/authentication/ui/coach_setting_page.dart';
import '../../features/authentication/ui/coach_register_page.dart';
import '../../features/content/UI/closer_application/closer_application_preview_page.dart';
import '../../features/content/UI/closer_application/closer_set_alarm_page.dart';
import '../../features/content/UI/home_page/filter_page.dart';
import '../../features/content/UI/home_page/closer_job_details_page.dart';
import '../../features/content/UI/home_page/closer_notifications_page.dart';
import '../../features/content/UI/coach_application/coach_application_list_page.dart';
import '../../features/content/UI/coach_application/coach_application_preview_page.dart';
import '../../features/content/UI/coach_application/coach_applications_page.dart';
import '../../features/content/UI/home_page/home_page.dart';
import '../../features/shared_pages/scaffold_with_navbar.dart';
import '../../features/shared_pages/splash_page.dart';
import '../../features/content/UI/closer_application/closer_applications_page.dart';
import '../../utils/errors/page_not_found.dart';
import 'route_names.dart';
import 'route_path.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
@riverpod
GoRouter router(RouterRef ref) {
  AsyncValue<User?> authState = ref.watch(authStateStreamProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutePath.splash,
    redirect: (context, state) {
      if (authState is AsyncLoading<User?>) {
        return RoutePath.splash;
      }
      if (authState is AsyncError<User?>) {
        return RoutePath.firebaseError;
      }
      final authenticated = authState.valueOrNull != null;
      final authenticatingPages = [
        RoutePath.onboardingLogin,
        RoutePath.onboardingRegister,
        RoutePath.signin,
        RoutePath.closerRegister,
        RoutePath.coachRegister,
      ];
      var authenticating = authenticatingPages.contains(state.matchedLocation);

      if (!authenticated) {
        return authenticating ? null : RoutePath.onboardingLogin;
      }

      final splashing = state.matchedLocation == RoutePath.splash;
      return (authenticating || splashing) ? RoutePath.home : null;
    },
    routes: [
      GoRoute(
        path: RoutePath.splash,
        name: RouteNames.splash,
        builder: (ctx, state) {
          print('##### splash #####');
          return const SplashPage();
        },
      ),
      GoRoute(
        path: RoutePath.signin,
        name: RouteNames.login,
        builder: (ctx, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: RoutePath.onboardingLogin,
        name: RouteNames.onboardingLogin,
        builder: (ctx, state) {
          return const OnboardingLoginPage();
        },
      ),
      GoRoute(
        path: RoutePath.onboardingRegister,
        name: RouteNames.onboardingRegister,
        builder: (ctx, state) {
          return const OnboardingRegisterPage();
        },
      ),
      GoRoute(
        path: RoutePath.closerRegister,
        name: RouteNames.closerRegister,
        builder: (ctx, state) {
          return const CloserRegisterPage();
        },
      ),
      GoRoute(
        path: RoutePath.coachRegister,
        name: RouteNames.coachRegister,
        builder: (ctx, state) {
          return const CoachRegisterPage();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.home,
                name: RouteNames.home,
                builder: (ctx, state) {
                  return const HomePage();
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: RoutePath.filter,
                    name: RouteNames.filter,
                    builder: (ctx, state) {
                      return const FilterPage();
                    },
                  ),
                  GoRoute(
                    path: RoutePath.jobDetails,
                    name: RouteNames.jobDetails,
                    builder: (ctx, state) {
                      return const CloserJobDetailsPage();
                    },
                  ),
                  GoRoute(
                    path: RoutePath.notifications,
                    name: RouteNames.notifications,
                    builder: (ctx, state) {
                      return const CloserNotificationsPage();
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.closerApplication,
                name: RouteNames.applications,
                builder: (ctx, state) {
                  return const CloserApplicationsPage();
                },
                routes: [
                  GoRoute(
                    path: RoutePath.closerApplicationPreview,
                    name: RouteNames.closerApplicationPreview,
                    builder: (ctx, state) {
                      return const CloserApplicationPreviewPage();
                    },
                  ),
                  GoRoute(
                    path: RoutePath.setAlarm,
                    name: RouteNames.setAlarm,
                    builder: (ctx, state) {
                      return const CloserSetAlarmPage();
                    },
                  ),
                  GoRoute(
                    path: RoutePath.coachApplication,
                    name: RouteNames.coachApplication,
                    builder: (ctx, state) {
                      return const CoachApplicationsPage();
                    },
                    routes: [
                      GoRoute(
                        path: RoutePath.coachApplicationPreview,
                        name: RouteNames.coachApplicationPreview,
                        builder: (ctx, state) {
                          return const CoachApplicationPreviewPage();
                        },
                      ),
                      GoRoute(
                        path: RoutePath.coachApplicationList,
                        name: RouteNames.coachApplicationList,
                        builder: (ctx, state) {
                          return const CoachApplicationListPage();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.closerSetting,
                name: RouteNames.setting,
                builder: (ctx, state) {
                  return const SettingPage();
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: RoutePath.editProfile,
                    name: RouteNames.editProfile,
                    builder: (ctx, state) {
                      return const EditProfilePage();
                    },
                  ),
                  GoRoute(
                    path: RoutePath.coachSetting,
                    name: RouteNames.coachSetting,
                    builder: (ctx, state) {
                      return const CoachSettingPage();
                    },
                    routes: [
                      GoRoute(
                        path: RoutePath.coachEditProfile,
                        name: RouteNames.coachEditProfile,
                        builder: (ctx, state) {
                          return const CoachEditProfilePage();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return PageNotFound(errorMessage: state.error.toString());
    },
  );
}
