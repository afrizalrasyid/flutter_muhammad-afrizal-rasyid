import 'package:flutter/material.dart';
import 'package:rasyid/home.dart';
import 'package:rasyid/prioritas_1.dart';
import 'package:rasyid/prioritas_2.dart';

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
        '/prioritas_1': (_) => const Prioritas1(),
        '/prioritas_2': (_) => const Prioritas2(),
      },
    );
  }
}
