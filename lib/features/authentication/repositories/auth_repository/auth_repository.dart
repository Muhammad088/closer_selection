import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/constants/firebase_constants.dart';
import '../handle_exceptions.dart';

class AuthRepository {
  User? get currentUser => fbAuth.currentUser;
  Future<void> signupAsCloser({
    required String email,
    required String name,
    required String type,
    required String password,
    required String phoneNumber,
    required String availability,
    required String typeOfJob,
    required String zipCode,
    String? photo,
  }) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final signedInUser = userCredential.user!;
      await usersCollection.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'type': type,
        'phone_number': phoneNumber,
        'availability': availability,
        'type_of_job': typeOfJob,
        'zip_code': zipCode,
        'photo': photo,
      });
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signupAsCoach({
    required String email,
    required String name,
    required String type,
    required String password,
    required String phoneNumber,
    required String typeOfJob,
    required String zipCode,
    String? photo,
  }) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final signedInUser = userCredential.user!;
      await usersCollection.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'type': type,
        'phone_number': phoneNumber,
        'type_of_job': typeOfJob,
        'zip_code': zipCode,
        'photo': photo,
      });
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await fbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateUser({
    required String uid,
    required Map<Object, Object?> data,
  }) async {
    try {
      await usersCollection.doc(uid).update(data);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signout() async {
    try {
      // throw 'signout error';
      await fbAuth.signOut();
    } catch (e) {
      throw handleException(e);
    }
  }
}
