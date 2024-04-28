import 'package:flutter/material.dart';

import '../model/category_model.dart';

class EmployeeVm extends ChangeNotifier {
  CategoryModel categoryModel = const CategoryModel();
  CategoryModelList categoryModelList = const CategoryModelList();

  EmployeeVm() {
    getCategories();
  }

  getCategories() async {
    categoryModelList = await CategoryModelList.fromApi({});
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
