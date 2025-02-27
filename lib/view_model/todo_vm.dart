import 'package:flutter/material.dart';
import 'package:mine/config/hive/hive_db.dart';
import 'package:mine/helper/helper.dart';

import '../model/student_model.dart';

class TodoVm extends ChangeNotifier {
  StudentModel studentModel = const StudentModel();
  StudentModelList studentModelList = const StudentModelList();
  bool isLightTheme = true;
  String? searchFilter;

  TodoVm() {
    getStudent();
  }

  Future<void> save() async {
    if (studentModel.name == null || studentModel.name?.isEmpty == true) {
    } else {
      studentModel = studentModel.copyWith(dob: DateTime.now());
      studentModel = studentModel.copyWith(id: studentModelList.data.length + 1);
      studentModelList = studentModelList.copyWith(data: [...studentModelList.data, studentModel]);
      await HiveDB.toDb("HiveDB", "data", studentModelList.toJson());
      await getStudent();
      logX(studentModelList.toJson());
    }
    notifyListeners();
  }

  Future<void> update(int id) async {
    if (studentModel.name == null || studentModel.name!.isEmpty) {}
    studentModelList = studentModelList.copyWith(
        data: studentModelList.data.map((e) {
      if (e.id == id) {
        return studentModel;
      } else {
        return e;
      }
    }).toList());
    await HiveDB.toDb("HiveDB", "data", studentModelList.toJson());
    notifyListeners();
  }

  Future<void> getStudent() async {
    var data = await HiveDB.fromDb("HiveDB", "data");
    if (data != null) {
      studentModelList = StudentModelList.fromJson(data);
    }
    notifyListeners();
  }

  Future<void> delete(int id) async {
    studentModelList = studentModelList.copyWith(data: studentModelList.data.where((element) => element.id != id).toList());
    await HiveDB.toDb("HiveDB", "data", studentModelList.toJson());
    notifyListeners();
  }

  Future<void> search(String value) async {
    searchFilter = value;
    var data = await HiveDB.fromDb("HiveDB", "data");
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
