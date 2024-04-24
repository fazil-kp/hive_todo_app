// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };

_$ContactModelListImpl _$$ContactModelListImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactModelListImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContactModelListImplToJson(
        _$ContactModelListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
