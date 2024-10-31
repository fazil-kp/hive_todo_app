import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  const factory StudentModel({
    int? id,
    int? phone,        
    String? name,
    String? address,
    String? email,
    String? gender,
    DateTime? dob,
    List<DateTime?>? duration,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}

@freezed
class StudentModelList with _$StudentModelList {
  const factory StudentModelList({
    @Default([]) List<StudentModel> data,
  }) = _StudentModelList;

  factory StudentModelList.fromJson(Map<String, dynamic> json) => _$StudentModelListFromJson(json);
}