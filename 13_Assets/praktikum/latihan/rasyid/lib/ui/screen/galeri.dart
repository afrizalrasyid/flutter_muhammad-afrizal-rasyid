import 'package:flutter/material.dart';
  
class Galeri extends StatelessWidget {
  const Galeri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: [
            Text('Test')
          ],
        ),
      ),
    );
  }

  
}