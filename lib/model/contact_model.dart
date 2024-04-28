// ignore_for_file: invalid_annotation_target

import 'package:core/api/api_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../api/apis.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    int? id,
    String? name,
    String? email,
    String? phone,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);

  static Future<ContactModel> toApi(Map<String, dynamic> data) async {
    return await Helper.postRest(Api.contact, data).then((value) {
      return ContactModel.fromJson(value);
    });
  }
}

@freezed
class ContactModelList with _$ContactModelList {
  const factory ContactModelList({
    @Default([]) List<ContactModel> data,
  }) = _ContactModelList;

  factory ContactModelList.fromJson(Map<String, dynamic> json) => _$ContactModelListFromJson(json);

  static Future<ContactModelList> fromApi(Map<String, dynamic> data) async {
    return await Helper.getRest(Api.contact, data).then((value) {
      return ContactModelList.fromJson(value);
    });
  }
}
