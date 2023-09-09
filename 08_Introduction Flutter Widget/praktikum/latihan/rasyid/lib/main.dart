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
          title: const Text('Material App')
          ),
        body: const Center(
          child: Text("material app"),
        ),
        drawer:  Drawer(
          child:  ListView(
            children: const [
              DrawerHeader(         
                decoration: BoxDecoration(color: Colors.blue),       
                child: Text('Drawer Header')
              ),
              ListTile(title: Text('List Tile 1'),
              ),
              ListTile(title: Text('List Tile 2'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
            NavigationDestination(icon: Icon(Icons.person), label: 'profile')
          ],
        ),
      )
    );
  }
}
