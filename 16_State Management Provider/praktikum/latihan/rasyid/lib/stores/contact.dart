import 'package:flutter/material.dart';
import 'package:rasyid/model.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;

  void removeContact(int index) {
    if (index < _contacts.length) {
      _contacts.removeAt(index);
      notifyListeners();
    }
  }

  void updateContact(int index, GetContact updatedContact) {
    if (index >= 0 && index < contacts.length) {
      contacts[index] = updatedContact;
      notifyListeners();
    }
  }

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
