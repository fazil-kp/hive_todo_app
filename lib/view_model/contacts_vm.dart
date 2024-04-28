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

  Future<void> deleteContact(int id) async {
    contactModelList = contactModelList.copyWith(data: contactModelList.data.toList()..removeWhere((element) => element.id == id));
    await ContactModel.toApi(contactModelList.toJson());
    printx(contactModelList.toJson(), "deleteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    await getContact();
    notifyListeners();
  }

  Future<void> updateContact(int id) async {
    contactModelList = contactModelList.copyWith(data: contactModelList.data.map((e) => e.id == id ? contactModel : e).toList());
    await ContactModel.toApi(contactModelList.toJson());
    await getContact();
    notifyListeners();
  }

  void clear() {
    contactModel = const ContactModel();
    notifyListeners();
  }
}
