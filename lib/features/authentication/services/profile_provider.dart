import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/app_user.dart';
import '../repositories/profile_repository/profile_repository_provider.dart';

part 'profile_provider.g.dart';

@riverpod
FutureOr<AppUser> profile(ProfileRef ref, String uid) {
  return ref.watch(profileRepositoryProvider).getProfile(uid: uid);
}
