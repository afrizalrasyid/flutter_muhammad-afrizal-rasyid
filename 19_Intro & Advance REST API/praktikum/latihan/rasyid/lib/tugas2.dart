import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Tugas2 extends StatefulWidget {
  const Tugas2({super.key});

  @override
  State<Tugas2> createState() => _Tugas2State();
}

Future<Response> fetchImage() async {
  final dio = Dio();
  final response = await dio.get('https://api.dicebear.com/7.x/bottts/jpg');
  return response;
}

class _Tugas2State extends State<Tugas2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Prioritas 2'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Center(
            child: FutureBuilder<Response>(
              future: fetchImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final response = snapshot.data!;
                  if (response.statusCode == 200) {
                    const imageUrl = 'https://api.dicebear.com/7.x/bottts/jpg';
                    return Image.network(imageUrl);
                  } else {
                    return const Text('Gagal mengambil gambar dari API');
                  }
                } else {
                  return const Text('Tidak ada data');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
