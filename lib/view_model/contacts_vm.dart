import 'package:core/api/api_helper.dart';
import 'package:core/model/common_model.dart';
import 'package:flutter/material.dart';
import 'package:project/model/contact_model.dart';

class ContactsViewModel extends ChangeNotifier {
  ContactModel contactModel = const ContactModel();
  ContactModelList contactModelList = const ContactModelList();
  VmStateModel vmStateModel = const VmStateModel();

  ContactsViewModel() {
    getContact();
    save();
  }
  getContact() async {
    contactModelList = await ContactModelList.fromApi({});
    printx(contactModelList, 'contactsssssssssssssssssssssssssssss');
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  Future<void> save() async {
    contactModel = await ContactModel.toApi({});
    printx("save here");
    printx(contactModel, 'contactAddddddddddddddddddddddddddddddddddddddd');
    notifyListeners();
  }

  void clear() {
    contactModel = const ContactModel();
    notifyListeners();
  }
}
