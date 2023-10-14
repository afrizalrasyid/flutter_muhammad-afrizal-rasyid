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
          title: const Row(
            children: [
              Image(
                image: AssetImage('assets/images/icon.png'),
                color: Colors.white,
                width: 35,
              ),
              SizedBox(width: 10.0),
              Text(
                'Our Furniture',
                style: TextStyle(
                  fontSize: 20,
                ),
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
                            fontSize: 19, fontWeight: FontWeight.w600),
                      )),
                  Positioned(
                      left: 140,
                      top: 60,
                      child: Text(
                        'Comfort is our priority',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ))
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        child: const Text(
                          'More',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  const Image(
                    height: 358,
                    image: AssetImage(
                      'assets/images/section_1.jpg',
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Image(
                      height: 314,
                      image: AssetImage(
                        'assets/images/section_2.jpg',
                      )),
                  const SizedBox(
                    width: 30,
                  ),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        child: const Text(
                          'Store',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Contact us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 22,
                  ),
                  SizedBox(
                    width: 335,
                    child: Text(
                      'Need to get in touch with us? Either fill out the form with your inquiry or find the departement email you like to contact below.',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First name*'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 228, 228),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last Name'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 228, 228),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email*'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 228, 228),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('What can we help you with?'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 228, 228, 228),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
