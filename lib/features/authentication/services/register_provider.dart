import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_repository/auth_repository_provider.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() {
      _key = null;
    });
  }

  Future<void> register({
    required String email,
    required String name,
    required String type,
    required String password,
    required String phoneNumber,
    String? availability,
    required String typeOfJob,
    required String zipCode,
  }) async {
    state = const AsyncLoading<void>();
    print("registering");
    final key = _key;
    AsyncValue<void> newState;
    if (type == "closer") {
      newState = await AsyncValue.guard<void>(
        () => ref.read(authRepositoryProvider).signupAsCloser(
              // email: "user04@gmail.com",
              // name: "user04",
              // type: "closer",
              // password: "123456",
              // phoneNumber: "1234567890",
              // availability: "avai",
              // typeOfJob: "commission",
              // zipCode: "11212",
              email: email,
              name: name,
              type: "closer",
              password: password,
              phoneNumber: phoneNumber,
              availability: availability!,
              typeOfJob: typeOfJob,
              zipCode: zipCode,
            ),
      );
    } else {
      newState = await AsyncValue.guard<void>(
        () => ref.read(authRepositoryProvider).signupAsCoach(
              email: email,
              name: name,
              type: "coach",
              password: password,
              phoneNumber: phoneNumber,
              typeOfJob: typeOfJob,
              zipCode: zipCode,
            ),
      );
    }
    if (key == _key) {
      state = newState;
    }
  }
}
