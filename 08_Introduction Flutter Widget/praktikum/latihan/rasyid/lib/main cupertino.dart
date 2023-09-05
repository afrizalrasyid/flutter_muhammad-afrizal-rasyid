import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
const HelloWorld({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const CupertinoApp(            
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Cupertino"),
        ),
        child: Center(
          child: Text("cupertino"),
        ),
      ),
    );
  }
}
