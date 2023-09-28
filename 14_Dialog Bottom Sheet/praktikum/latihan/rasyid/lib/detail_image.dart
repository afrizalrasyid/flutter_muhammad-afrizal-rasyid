import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Image'),
        ),
        body: const Center(
          child: Column(                                          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ini adalah detail image',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}