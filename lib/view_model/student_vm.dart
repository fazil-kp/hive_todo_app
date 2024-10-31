import 'package:flutter/material.dart';
import 'package:mine/helpers/hive/hive_db.dart';

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
      await SmartDB.toDb("SmartDB", "data", studentModelList.toJson());
      await getStudent();
      print(studentModelList.toJson());
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
    await SmartDB.toDb("SmartDB", "data", studentModelList.toJson());
    notifyListeners();
  }

  Future<void> getStudent() async {
    var data = await SmartDB.fromDb("SmartDB", "data");
    if (data != null) {
      studentModelList = StudentModelList.fromJson(data);
    }
    notifyListeners();
  }

  delete(int id) async {
    studentModelList = studentModelList.copyWith(data: studentModelList.data.where((element) => element.id != id).toList());
    await SmartDB.toDb("SmartDB", "data", studentModelList.toJson());
    notifyListeners();
  }

  void search() async {
    var data = await SmartDB.fromDb("SmartDB", "data");
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
