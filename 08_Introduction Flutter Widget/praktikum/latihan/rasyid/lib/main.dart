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
          title: const Text(
            'Hello World!'
            )
          ),
          body: const Text('test'),
        ),
    );
  }
}
