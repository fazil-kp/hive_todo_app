import 'package:core/helpers/core_helpers.dart';
import 'package:flutter/material.dart';
import 'package:project/model/contact_model.dart';

class ContactsViewModel extends ChangeNotifier {
  ContactModel contactModel = const ContactModel();
  ContactModelList contactModelList = const ContactModelList();

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
    await getContact();
    notifyListeners();
  }

  // Future<void> deleteContact(int id) async {
  //   await ContactModel.delete({"id": id}).then((value) {
  //     printx(contactModelList.toJson(), "deleteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
  //     getContact();
  //     notifyListeners();
  //   });
  // }

  deleteContact(int id) async {
    contactModelList = await ContactModelList.fromApi({});

    contactModelList = contactModelList.copyWith(
      data: contactModelList.data.where((element) => element.id != id).toList(growable: false),
    );
    await ContactModel.delete({"id": id});
    contactModel = await ContactModel.toApi(contactModel.toJson());
    refresh();
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
