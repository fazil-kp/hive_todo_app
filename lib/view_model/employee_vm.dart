import 'package:flutter/material.dart';
import 'package:my_core/api/api_helper.dart';

import '../model/category_model.dart';

class EmployeeVm extends ChangeNotifier {
  CategoryModel categoryModel = const CategoryModel();
  CategoryModelList categoryModelList = const CategoryModelList();

  EmployeeVm() {
    getCategories();
  }

  getCategories() async {
    categoryModelList = await CategoryModelList.fromApi({});
    printx(categoryModelList, 'categoryyyyyyyyyyyyyyyyyyyyy');
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
