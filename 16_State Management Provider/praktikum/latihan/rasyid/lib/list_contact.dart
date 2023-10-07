import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rasyid/model.dart';
import 'package:rasyid/stores/contact.dart' as contact_store;

void main() {
  runApp(const MaterialApp(
    home: ListContact(),
  ));
}

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContact();
}

class _ListContact extends State<ListContact> {
  String name = '';
  String phoneNumber = '';
  var inputNameControllers = TextEditingController();
  var inputNumberControllers = TextEditingController();

  @override
  void dispose() {
    inputNameControllers.dispose();
    inputNumberControllers.dispose();
    super.dispose();
  }

  bool _validateName() {
    if (name.isEmpty) {
      return false;
    }

    List<String> nameParts = name.split(' ');
    if (nameParts.length < 2) {
      return false;
    }

    for (String part in nameParts) {
      if (!_isCapitalized(part) || _containsSpecialCharacters(part)) {
        return false;
      }
    }

    return true;
  }

  bool _validatePhoneNumber() {
    if (phoneNumber.isEmpty) {
      return false;
    }

    // Validasi panjang nomor telepon
    if (phoneNumber.length < 8 || phoneNumber.length > 15) {
      return false;
    }

    // Validasi nomor telepon harus dimulai dengan angka 0
    if (!phoneNumber.startsWith('0')) {
      return false;
    }

    // Validasi nomor telepon hanya mengandung angka
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      return false;
    }

    return true;
  }

  bool _isCapitalized(String word) {
    if (word.isEmpty) {
      return false;
    }
    return word[0] == word[0].toUpperCase();
  }

  bool _containsSpecialCharacters(String word) {
    return RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(word);
  }

  late contact_store.Contact contactProvider;

  @override
  Widget build(BuildContext context) {
    contactProvider = Provider.of<contact_store.Contact>(context);
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              const Icon(Icons.phone_android),
              const SizedBox(height: 20),
              const Text(
                'Create New Contacts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(
                  'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),
              TextField(
                controller: inputNameControllers,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Insert Your Name',
                ),
                onChanged: (String value) {
                  name = value;
                },
              ),
              const SizedBox(height: 15),
              TextField(
                controller: inputNumberControllers,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nomor',
                  hintText: '+62 ....',
                ),
                onChanged: (String value) {
                  phoneNumber = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_validateName() && _validatePhoneNumber()) {
                        contactProvider.add(
                          GetContact(
                            name: name,
                            phoneNumber: phoneNumber,
                          ),
                        );
                        inputNameControllers.clear();
                        inputNumberControllers.clear();
                      } else {
                        // Tampilkan pesan kesalahan jika validasi tidak terpenuhi
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Validation Error"),
                              content: const Text(
                                  "Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital, dan tidak boleh mengandung angka atau karakter khusus. Nomor telepon harus terdiri dari angka saja, panjang minimal 8 digit, maksimal 15 digit, dan harus dimulai dengan angka 0."),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.deepPurple),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'List Contacts',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: contactProvider.contacts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const FlutterLogo(),
                      title: Text(contactProvider.contacts[index].name),
                      subtitle:
                          Text(contactProvider.contacts[index].phoneNumber),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              alertEdit(context, index);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              contactProvider.removeContact(index);
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> alertEdit(BuildContext context, int index) async {
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController phoneEditingController = TextEditingController();

    nameEditingController.text = contactProvider.contacts[index].name;
    phoneEditingController.text = contactProvider.contacts[index].phoneNumber;

    // ignore: unused_local_variable
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Align(
          alignment: Alignment.center,
          child: Text("Edit Data"),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(controller: nameEditingController),
            const Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(controller: phoneEditingController),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    contactProvider.updateContact(
                      index,
                      GetContact(
                        name: nameEditingController.text,
                        phoneNumber: phoneEditingController.text,
                      ),
                    );
                    Navigator.pop(context, true);
                  },
                  child: const Text("Edit")),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
