import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <Map<String, dynamic>> listMahasiswa = [];
  String dropDownValue = 'Pilih Universitas';
  var checkValue1 = false;
  var checkValue2 = false;
  var checkValue3 = false;

  DateTime _duedate = DateTime.now();
  final currentDate = DateTime.now();
  
  var inputControllers = TextEditingController();
  var radioValue = '';
  
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(        
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Latihan'),
      ),
      body: SingleChildScrollView(
        child: Container(          
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Center(
            child: Column(
            children: [                          
              const Text('List Anak Didik'),
              TextField(
                controller: inputControllers,
                onChanged: (inputControllers) {
                  print('$inputControllers');
                },
              ),
              Row(
                children: [
                  Radio(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  const Text('Laki - laki'),
                ],
              ),

              Row(
                children: [
                  Radio(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {                          
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  const Text('Perempuan'),
                ],
              ),
              //checkbox simple
              const Divider(),
              Row(
                children: [
                  Checkbox(
                      value: checkValue1,                                            
                      onChanged: (bool? value) {
                        setState(() {
                          checkValue1 = value!;
                          if (value == true) {
                            print("C++");
                          }                          
                        });
                      }),
                  const Text('C++'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: checkValue2,                                            
                      onChanged: (bool? value) {
                        setState(() {
                          checkValue2 = value!;
                          if (value == true) {
                            print("Dart");
                          }  
                        });
                      }),
                  const Text('Dart'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: checkValue3,                      
                      onChanged: (bool? value) {
                        setState(() {
                          checkValue3 = value!;    
                          if (value == true) {
                            print("PHP");
                          }                       
                        });
                      }),
                  const Text('PHP'),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  DropdownButton(
                      value: dropDownValue,
                      items: const [
                        DropdownMenuItem(
                          value: "Pilih Universitas",
                          child: Text('Pilih Universitas'),
                        ),
                        DropdownMenuItem(
                          value: "UBSI", 
                          child: Text('UBSI')
                        ),
                        DropdownMenuItem(
                          value: "PNJ", 
                          child: Text('PNJ')
                        ),
                        DropdownMenuItem(
                          value: "ITI", 
                          child: Text('ITI')
                        )
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue = value ?? "Pilih";
                          dropDownValue;
                        });
                      }),
                ],
              ),

              const Divider(),    
              buildDatePicker(context),

              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  setState(() {
                    listMahasiswa.add({
                      "nama": inputControllers.text,
                      "jenis_kelamin": radioValue,
                      "bahasa_pemrograman": [
                        if (checkValue1) 'C++',
                        if (checkValue2) 'Dart',
                        if (checkValue3) 'PHP'
                        ],
                      "universitas": dropDownValue,
                    });
                  });
                  print('Data Mahasiswa : $listMahasiswa');
                },
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: listMahasiswa.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mahasiswa = listMahasiswa;
                        return ListTile(
                          leading: const FlutterLogo(),
                          title: Text('${mahasiswa[index]["nama"]}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${mahasiswa[index]["jenis_kelamin"]}'),
                              Text('${mahasiswa[index]["bahasa_pemrograman"].join(', ')}'),
                              Text('${mahasiswa[index]["universitas"]}')
                            ],
                          ),
                          trailing:  Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [                              
                              IconButton(
                                onPressed: (){
                                  alertEdit(context, index);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    listMahasiswa.removeAt(index);
                                  });
                                  print("delete");
                                },
                                icon: const Icon(Icons.delete)
                              )
                            ],
                          )
                        );
                      }
                  )
              ),
            ],
          )
          ),
        ),
      ),
    )
    );
  }

  Widget buildDatePicker(BuildContext context){
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
                  lastDate: DateTime(currentDate.year + 5)
                  );

                  setState(() {
                    if (selectDate != null){
                      _duedate = selectDate;
                    }
                  });
              },
              child: const Text('Select')
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_duedate),
        ),
      ],
    );
  }

  Future<void> alertEdit(BuildContext context, int index) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = listMahasiswa[index]['nama'];

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
              "Nama",
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
                onPressed:() {
                  setState(() {
                    listMahasiswa[index]['nama'] = textEditingController.text;
                  });
                  Navigator.pop(context, true);
                },
                child: const Text("Edit")
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Cancel")
              ),
            ],
          )
        ],
      )
    );    
  }        
}