// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get availability => throw _privateConstructorUsedError;
  @JsonKey(name: "type_of_job")
  String get typeOfJob => throw _privateConstructorUsedError;
  @JsonKey(name: "zip_code")
  String get zipCode => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String id,
      String type,
      String name,
      String email,
      @JsonKey(name: "phone_number") String phoneNumber,
      String? availability,
      @JsonKey(name: "type_of_job") String typeOfJob,
      @JsonKey(name: "zip_code") String zipCode,
      String? photo});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? availability = freezed,
    Object? typeOfJob = null,
    Object? zipCode = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      typeOfJob: null == typeOfJob
          ? _value.typeOfJob
          : typeOfJob // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String name,
      String email,
      @JsonKey(name: "phone_number") String phoneNumber,
      String? availability,
      @JsonKey(name: "type_of_job") String typeOfJob,
      @JsonKey(name: "zip_code") String zipCode,
      String? photo});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? availability = freezed,
    Object? typeOfJob = null,
    Object? zipCode = null,
    Object? photo = freezed,
  }) {
    return _then(_$AppUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      typeOfJob: null == typeOfJob
          ? _value.typeOfJob
          : typeOfJob // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AppUserImpl with DiagnosticableTreeMixin implements _AppUser {
  const _$AppUserImpl(
      {required this.id,
      this.type = "",
      required this.name,
      required this.email,
      @JsonKey(name: "phone_number") required this.phoneNumber,
      this.availability,
      @JsonKey(name: "type_of_job") required this.typeOfJob,
      @JsonKey(name: "zip_code") required this.zipCode,
      this.photo});

  @override
  final String id;
  @override
  @JsonKey()
  final String type;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  final String? availability;
  @override
  @JsonKey(name: "type_of_job")
  final String typeOfJob;
  @override
  @JsonKey(name: "zip_code")
  final String zipCode;
  @override
  final String? photo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(id: $id, type: $type, name: $name, email: $email, phoneNumber: $phoneNumber, availability: $availability, typeOfJob: $typeOfJob, zipCode: $zipCode, photo: $photo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('availability', availability))
      ..add(DiagnosticsProperty('typeOfJob', typeOfJob))
      ..add(DiagnosticsProperty('zipCode', zipCode))
      ..add(DiagnosticsProperty('photo', photo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.typeOfJob, typeOfJob) ||
                other.typeOfJob == typeOfJob) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, name, email,
      phoneNumber, availability, typeOfJob, zipCode, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final String id,
      final String type,
      required final String name,
      required final String email,
      @JsonKey(name: "phone_number") required final String phoneNumber,
      final String? availability,
      @JsonKey(name: "type_of_job") required final String typeOfJob,
      @JsonKey(name: "zip_code") required final String zipCode,
      final String? photo}) = _$AppUserImpl;

  @override
  String get id;
  @override
  String get type;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  String? get availability;
  @override
  @JsonKey(name: "type_of_job")
  String get typeOfJob;
  @override
  @JsonKey(name: "zip_code")
  String get zipCode;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
