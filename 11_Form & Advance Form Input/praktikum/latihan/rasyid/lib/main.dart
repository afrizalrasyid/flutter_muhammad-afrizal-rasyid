import 'package:flutter/material.dart';
void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatefulWidget {  
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  var dropDownValue = 0;
  var checkValue1 = false;
  var checkValue2 = false;
  var checkValue3 = false;
  
  var inputControllers = TextEditingController();
  var radioValue = '';
  List data_mahasiswa = [
    {
      "nama": "Rasyid", 
      "jenis_kelamin": "Laki-laki", 
      "bahasa_pemrograman": "Dart", 
      "universitas": "PNJ"
    }    
  ];
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.grey;
    }

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
                      fillColor: MaterialStateProperty.resolveWith(getColor),
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
                      fillColor: MaterialStateProperty.resolveWith(getColor),
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
                      fillColor: MaterialStateProperty.resolveWith(getColor),
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
              // CheckboxExample(),
              Row(
                children: [
                  DropdownButton(
                      value: dropDownValue,
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('Pilih Universitas'),
                        ),
                        DropdownMenuItem(
                          value: 1, child: Text('UBSI')
                        ),
                        DropdownMenuItem(
                          value: 2, child: Text('PNJ')
                        ),
                        DropdownMenuItem(
                          value: 3, child: Text('ITI')
                        )
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          dropDownValue = value ?? 0;
                          print(dropDownValue);
                        });
                      }),
                ],
              ),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  setState(() {
                    data_mahasiswa.add({
                      "nama": "${inputControllers.text}",
                      "jenis_kelamin": "$radioValue",
                      "bahasa_pemrograman": checkValue1,
                      "universitas": "$dropDownValue"
                    });
                  });

                  print('Data Mahasiswa : $data_mahasiswa');
                },
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: data_mahasiswa.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const FlutterLogo(),
                          title: Text('${data_mahasiswa[index]["nama"]}'),
                          subtitle: Text('${data_mahasiswa[index]["jenis_kelamin"]}'),                          

                        );
                      })
                  ),
              
            ],
          )),
        ),
      ),
    ));
  }
}