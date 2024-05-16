// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      id: (json['id'] as num?)?.toInt(),
      phone: (json['phone'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      duration: (json['duration'] as List<dynamic>?)
          ?.map((e) => e == null ? null : DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'duration': instance.duration?.map((e) => e?.toIso8601String()).toList(),
    };

_$StudentModelListImpl _$$StudentModelListImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentModelListImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => StudentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StudentModelListImplToJson(
        _$StudentModelListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
