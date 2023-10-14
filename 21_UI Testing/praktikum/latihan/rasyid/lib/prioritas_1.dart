import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(MaterialApp(
    home: Prioritas1(),
  ));
}

class Prioritas1 extends StatefulWidget {
  const Prioritas1({super.key});

  @override
  State<Prioritas1> createState() => _Prioritas1State();
}

class _Prioritas1State extends State<Prioritas1> {
  List<Map<String, dynamic>> listContacts = [];

  var inputNameControllers = TextEditingController();
  var inputNumberControllers = TextEditingController();

  DateTime _duedate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = Colors.orange;

  bool _validateName(String name) {
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

  bool _validatePhoneNumber(String phoneNumber) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Soal Prioritas 1'),
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
                onChanged: (inputNameControllers) {
                  print('$inputNameControllers');
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
                onChanged: (inputNumberControllers) {
                  print('$inputNumberControllers');
                },
              ),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),
              buildDatePicker(context),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),
              buildColorPicker(context),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),
              buildFilePicker(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String name = inputNameControllers.text;
                      String number = inputNumberControllers.text;
                      DateTime date = _duedate;
                      Color color = _currentColor;
                      String? fileName;

                      if (selectedFile != null) {
                        fileName = selectedFile!.name;
                      }

                      if (_validateName(name) && _validatePhoneNumber(number)) {
                        setState(() {
                          listContacts.add({
                            "name": name,
                            "number": number,
                            "date": date,
                            "color": color,
                            "file": fileName,
                          });
                          inputNameControllers.clear();
                          inputNumberControllers.clear();
                          print('Data Mahasiswa : $listContacts');
                        });
                      } else {
                        // Tampilkan pesan kesalahan jika validasi tidak terpenuhi
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Validation Error"),
                              content: Text(
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
                  )
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
                      itemCount: listContacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        var contact = listContacts;
                        Color contactColor = contact[index]["color"];
                        return ListTile(
                            leading: const FlutterLogo(),
                            title: Text('${contact[index]["name"]}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${contact[index]["number"]}'),
                                Text('Date = ${contact[index]["date"]}'),
                                Row(
                                  children: [
                                    Text('Color = '),
                                    Container(
                                      height:
                                          20, // Atur tinggi sesuai dengan preferensi Anda
                                      width:
                                          20, // Atur lebar sesuai dengan preferensi Anda
                                      color:
                                          contactColor, // Atur latar belakang sesuai dengan warna kontak
                                    ),
                                  ],
                                ),
                                Text('File Name = ${contact[index]["file"]}'),
                              ],
                            ),
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
                                      setState(() {
                                        listContacts.removeAt(index);
                                      });
                                      print("delete");
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ));
                      })),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date"),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));

                  setState(() {
                    if (selectDate != null) {
                      _duedate = selectDate;
                    }
                  });
                },
                child: const Text('Select'))
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_duedate),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        SizedBox(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick Your Color'),
                        content: BlockPicker(
                            pickerColor: _currentColor,
                            onColorChanged: (color) {
                              setState(() {
                                _currentColor = color;
                              });
                            }),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Save'))
                        ],
                      );
                    });
              },
              child: const Text('Pick Color')),
        )
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              onPressed: () {
                _pickFile();
              },
              child: const Text('Pick and Open File')),
        )
      ],
    );
  }

  PlatformFile? selectedFile;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // Mendapatkan file dari object result
    final file = result.files.first;
    selectedFile = file;
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future<void> alertEdit(BuildContext context, int index) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = listContacts[index]['name'];

    return showDialog(
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
                  TextField(
                    controller: textEditingController,
                  )
                ],
              ),
              actions: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            listContacts[index]['name'] =
                                textEditingController.text;
                          });
                          Navigator.pop(context, true);
                        },
                        child: const Text("Edit")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text("Cancel")),
                  ],
                )
              ],
            ));
  }
}
