import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
const HelloWorld({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(      
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Halo Alterra')
          ),
        body: const Center(
          child: Text("Nama saya adalah Muhammad Afrizal Rasyid"),
        ),        
      )
    );
  }
}
