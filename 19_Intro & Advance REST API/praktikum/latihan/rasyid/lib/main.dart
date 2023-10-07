import 'package:flutter/material.dart';
import 'package:rasyid/latihan.dart';
import 'package:rasyid/tugas.dart';
import 'package:rasyid/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const Home(),
        '/latihan': (_) => const Latihan(),
        '/tugas': (_) => const Tugas(),
      },
    );
  }
}
