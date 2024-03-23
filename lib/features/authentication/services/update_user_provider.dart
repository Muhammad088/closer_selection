import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_repository/auth_repository_provider.dart';

part 'update_user_provider.g.dart';

@riverpod
class UpdateUser extends _$UpdateUser {
  @override
  FutureOr<void> build() {}
  Future<void> updateUser({
    required String uid,
    required Map<Object, Object?> data,
  }) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => ref.read(authRepositoryProvider).updateUser(uid: uid, data: data),
    );
  }
}
