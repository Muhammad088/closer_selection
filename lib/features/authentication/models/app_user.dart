import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    @Default("") String type,
    required String name,
    required String email,
    @JsonKey(name: "phone_number") required String phoneNumber,
    String? availability,
    @JsonKey(name: "type_of_job") required String typeOfJob,
    @JsonKey(name: "zip_code") required String zipCode,
    String? photo,
  }) = _AppUser;

  factory AppUser.fromDoc(DocumentSnapshot appUserDoc) {
    final appUserData = appUserDoc.data() as Map<String, dynamic>;

    return AppUser(
      id: appUserDoc.id,
      type: appUserData['type'],
      name: appUserData['name'],
      email: appUserData['email'],
      phoneNumber: appUserData['phone_number'],
      availability: appUserData['availability'],
      typeOfJob: appUserData['type_of_job'],
      zipCode: appUserData['zip_code'],
      photo: appUserData['photo'],
    );
  }
}
