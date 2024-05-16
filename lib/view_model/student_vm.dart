import 'package:core/helpers/core_helpers.dart';
import 'package:core/helpers/core_hive_db.dart';
import 'package:flutter/material.dart';

import '../model/student_model.dart';

class StudentVM extends ChangeNotifier {
  StudentModel studentModel = const StudentModel();
  StudentModelList studentModelList = const StudentModelList();
  bool isLightTheme = true;
  String? searchFilter;

  StudentVM() {
    getStudent();
  }

  Future<void> save() async {
    if (studentModel.name == null || studentModel.name?.isEmpty == true) {
    } else {
      studentModel = studentModel.copyWith(dob: DateTime.now());
      studentModel = studentModel.copyWith(id: studentModelList.data.length + 1);
      studentModelList = studentModelList.copyWith(data: [...studentModelList.data, studentModel]);
      await CoreDB.toDb(Const.hiveBox, "data", studentModelList.toJson());
      await getStudent();
      printx(studentModelList.toJson());
    }
    notifyListeners();
  }

  Future<void> update(int id) async {
    if (studentModel.name == null || studentModel.name!.isEmpty) {
      notifyListeners();
      return;
    }
    studentModelList = studentModelList.copyWith(
        data: studentModelList.data.map((e) {
      if (e.id == id) {
        return studentModel;
      } else {
        return e;
      }
    }).toList());
    await CoreDB.toDb(Const.hiveBox, "data", studentModelList.toJson());
    notifyListeners();
  }

  Future<void> getStudent() async {
    var data = await CoreDB.fromDb(Const.hiveBox, "data");
    if (data != null) {
      studentModelList = StudentModelList.fromJson(data);
    }
    notifyListeners();
  }

  delete(int id) async {
    studentModelList = studentModelList.copyWith(data: studentModelList.data.where((element) => element.id != id).toList());
    await CoreDB.toDb(Const.hiveBox, "data", studentModelList.toJson());
    notifyListeners();
  }

  void search() async {
    var data = await CoreDB.fromDb(Const.hiveBox, "data");
    if (data != null) {
      studentModelList = StudentModelList.fromJson(data);
      studentModelList = studentModelList.copyWith(
        data: studentModelList.data.where((element) {
          bool matchesTitle = element.name?.toLowerCase().contains(searchFilter ?? '') ?? false;
          bool matchesId = element.id?.toString().contains(searchFilter ?? '') ?? false;
          bool matchesDescription = element.phone?.toString().toLowerCase().contains(searchFilter ?? '') ?? false;

          return matchesTitle || matchesId || matchesDescription;
        }).toList(),
      );
    }
    notifyListeners();
  }

  void clear() {
    studentModel = const StudentModel();
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
