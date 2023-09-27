import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(          
          backgroundColor: Colors.grey.shade800,
          title: Row(
            children: [
              Image.asset(
                'assets/images/icon.png',
                color: Colors.white,
                width: 35,
              ),
              const SizedBox(width: 10.0),
              const Text(
                'Our Furniture',
                style: TextStyle(fontSize: 20,), 
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Stack(
                children: <Widget>[
                  Image(                    
                    image: AssetImage('assets/images/header_couch.jpg'),
                  ),
                  Positioned(
                    left: 100,
                    top: 35,
                    child: Text(
                      'Welcome To Our Furniture',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  Positioned(
                    left: 140,
                    top: 60,
                    child: Text(
                      'Comfort is our priority',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                    )
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Take a look!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text('Find everything you need'),
                      ElevatedButton(                        
                        onPressed: (){},                         
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800
                        ),
                        child: const Text(
                          'More',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 35,),
                  const Image(
                    height: 358,                                        
                    image: AssetImage(
                      'assets/images/section_1.jpg',
                    )
                  )
                ],
              ),
              Row(
                children: [                  
                  const Image(
                    height: 314,                                        
                    image: AssetImage(
                      'assets/images/section_2.jpg',
                    )
                  ),
                  const SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Go Visit Us!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('We are present in several'),
                          Text('place'),
                        ],
                      ),
                      ElevatedButton(                        
                        onPressed: (){},                         
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800
                        ),
                        child: const Text(
                          'Store',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 70,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Text(
                    'Contact us',                  
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              const Row(
                children: [
                  SizedBox(width: 22,),
                  Text(
                    'Need to get in touch with us? Either fill out the form with your',                  
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),              
              const Row(
                children: [
                  SizedBox(width: 22,),
                  Text(
                    'inquiry or find the department email you like to contact below.',                  
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                children: [
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text('First name*'),
                      Form(child: Text('test'))
                    ],
                  ),
                  Text('Last name'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
