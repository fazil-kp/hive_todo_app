// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return _StudentModel.fromJson(json);
}

/// @nodoc
mixin _$StudentModel {
  int? get id => throw _privateConstructorUsedError;
  int? get phone => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  List<DateTime?>? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentModelCopyWith<StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelCopyWith<$Res> {
  factory $StudentModelCopyWith(
          StudentModel value, $Res Function(StudentModel) then) =
      _$StudentModelCopyWithImpl<$Res, StudentModel>;
  @useResult
  $Res call(
      {int? id,
      int? phone,
      String? name,
      String? address,
      String? email,
      String? gender,
      DateTime? dob,
      List<DateTime?>? duration});
}

/// @nodoc
class _$StudentModelCopyWithImpl<$Res, $Val extends StudentModel>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as List<DateTime?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentModelImplCopyWith<$Res>
    implements $StudentModelCopyWith<$Res> {
  factory _$$StudentModelImplCopyWith(
          _$StudentModelImpl value, $Res Function(_$StudentModelImpl) then) =
      __$$StudentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? phone,
      String? name,
      String? address,
      String? email,
      String? gender,
      DateTime? dob,
      List<DateTime?>? duration});
}

/// @nodoc
class __$$StudentModelImplCopyWithImpl<$Res>
    extends _$StudentModelCopyWithImpl<$Res, _$StudentModelImpl>
    implements _$$StudentModelImplCopyWith<$Res> {
  __$$StudentModelImplCopyWithImpl(
      _$StudentModelImpl _value, $Res Function(_$StudentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$StudentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value._duration
          : duration // ignore: cast_nullable_to_non_nullable
              as List<DateTime?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentModelImpl implements _StudentModel {
  const _$StudentModelImpl(
      {this.id,
      this.phone,
      this.name,
      this.address,
      this.email,
      this.gender,
      this.dob,
      final List<DateTime?>? duration})
      : _duration = duration;

  factory _$StudentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? phone;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final DateTime? dob;
  final List<DateTime?>? _duration;
  @override
  List<DateTime?>? get duration {
    final value = _duration;
    if (value == null) return null;
    if (_duration is EqualUnmodifiableListView) return _duration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StudentModel(id: $id, phone: $phone, name: $name, address: $address, email: $email, gender: $gender, dob: $dob, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            const DeepCollectionEquality().equals(other._duration, _duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phone, name, address, email,
      gender, dob, const DeepCollectionEquality().hash(_duration));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      __$$StudentModelImplCopyWithImpl<_$StudentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentModelImplToJson(
      this,
    );
  }
}

abstract class _StudentModel implements StudentModel {
  const factory _StudentModel(
      {final int? id,
      final int? phone,
      final String? name,
      final String? address,
      final String? email,
      final String? gender,
      final DateTime? dob,
      final List<DateTime?>? duration}) = _$StudentModelImpl;

  factory _StudentModel.fromJson(Map<String, dynamic> json) =
      _$StudentModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get phone;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  DateTime? get dob;
  @override
  List<DateTime?>? get duration;
  @override
  @JsonKey(ignore: true)
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentModelList _$StudentModelListFromJson(Map<String, dynamic> json) {
  return _StudentModelList.fromJson(json);
}

/// @nodoc
mixin _$StudentModelList {
  List<StudentModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentModelListCopyWith<StudentModelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelListCopyWith<$Res> {
  factory $StudentModelListCopyWith(
          StudentModelList value, $Res Function(StudentModelList) then) =
      _$StudentModelListCopyWithImpl<$Res, StudentModelList>;
  @useResult
  $Res call({List<StudentModel> data});
}

/// @nodoc
class _$StudentModelListCopyWithImpl<$Res, $Val extends StudentModelList>
    implements $StudentModelListCopyWith<$Res> {
  _$StudentModelListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentModelListImplCopyWith<$Res>
    implements $StudentModelListCopyWith<$Res> {
  factory _$$StudentModelListImplCopyWith(_$StudentModelListImpl value,
          $Res Function(_$StudentModelListImpl) then) =
      __$$StudentModelListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StudentModel> data});
}

/// @nodoc
class __$$StudentModelListImplCopyWithImpl<$Res>
    extends _$StudentModelListCopyWithImpl<$Res, _$StudentModelListImpl>
    implements _$$StudentModelListImplCopyWith<$Res> {
  __$$StudentModelListImplCopyWithImpl(_$StudentModelListImpl _value,
      $Res Function(_$StudentModelListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$StudentModelListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentModelListImpl implements _StudentModelList {
  const _$StudentModelListImpl({final List<StudentModel> data = const []})
      : _data = data;

  factory _$StudentModelListImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentModelListImplFromJson(json);

  final List<StudentModel> _data;
  @override
  @JsonKey()
  List<StudentModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StudentModelList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentModelListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentModelListImplCopyWith<_$StudentModelListImpl> get copyWith =>
      __$$StudentModelListImplCopyWithImpl<_$StudentModelListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentModelListImplToJson(
      this,
    );
  }
}

abstract class _StudentModelList implements StudentModelList {
  const factory _StudentModelList({final List<StudentModel> data}) =
      _$StudentModelListImpl;

  factory _StudentModelList.fromJson(Map<String, dynamic> json) =
      _$StudentModelListImpl.fromJson;

  @override
  List<StudentModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$StudentModelListImplCopyWith<_$StudentModelListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
