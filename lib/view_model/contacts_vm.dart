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
    contactModel = contactModel.copyWith(id: contactModelList.data.length + 1);
    contactModel = await ContactModel.toApi(contactModel.toJson());
    printx("save here");
    printx(contactModel.toJson(), 'contactAddddddddddddddddddddddddddddddddddddddd');
    await getContact();
    notifyListeners();
  }

  Future<void> updateContact(int id) async {}
  void clear() {
    contactModel = const ContactModel();
    notifyListeners();
  }
}
