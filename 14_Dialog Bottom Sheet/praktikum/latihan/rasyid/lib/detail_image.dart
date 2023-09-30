import 'package:flutter/material.dart';
import 'package:rasyid/galeri.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Detail Image'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ini adalah gambar detail'),
                Galeri.detailImage(),
              ],
            ),
          )),
    );
  }
}
