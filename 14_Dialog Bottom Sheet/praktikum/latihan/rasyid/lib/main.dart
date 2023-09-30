import 'package:flutter/material.dart';
import 'package:rasyid/contact.dart';
import 'package:rasyid/galeri.dart';
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
        '/contact': (_) => const Contact(),
        '/galeri': (_) => const Galeri(),
      },
    );
  }
}
