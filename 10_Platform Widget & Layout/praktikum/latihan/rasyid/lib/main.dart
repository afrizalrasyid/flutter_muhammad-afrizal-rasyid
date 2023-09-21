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
          backgroundColor: Colors.grey[700],       
          title: const Text('Material App')
          ),
        body: const Center(          
          child: Column(          
            children: [              
              ListTile(
                leading: FlutterLogo(),
                title: Text('Leanne Graham'),
                subtitle: Text('1-770-736-8031 x56442'),
              ),
              ListTile(
                leading: FlutterLogo(),
                title: Text('Erwin Howell'),
                subtitle: Text('010-692-6593'),
              ),
              ListTile(
                leading: FlutterLogo(),
                title: Text('Clementine Bauch'),
                subtitle: Text('1-463-123-4447'),
              ),
              ListTile(
                leading: FlutterLogo(),
                title: Text('Patricia Lebsack'),
                subtitle: Text('493-170-9623'),
              ),
              ListTile(
                leading: FlutterLogo(),
                title: Text('Chelsey Dietrich'),
                subtitle: Text('(254)954-1289'),
              ),
              ListTile(
                leading: FlutterLogo(),
                title: Text('Mrs. Dennis Schulist'),
                subtitle: Text('1-477-935-8478'),
              ),
              ListTile(
                leading: FlutterLogo(),
                title: Text('Kurtiss Weissnat'),
                subtitle: Text('210.067.6132'),
              ),
            ],
          ),
          
        ),
        drawer:  Drawer(
          backgroundColor: Colors.grey[800],       
          child:  ListView(
            children: const [
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
              ),              
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(          
          backgroundColor: Colors.grey[800],          
          destinations: const [                        
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'settings')            
          ],
        ),
      )
    );
  }
}
