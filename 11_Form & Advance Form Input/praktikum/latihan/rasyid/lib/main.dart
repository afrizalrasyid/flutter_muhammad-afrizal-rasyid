import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
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
          color: Colors.grey,
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
}