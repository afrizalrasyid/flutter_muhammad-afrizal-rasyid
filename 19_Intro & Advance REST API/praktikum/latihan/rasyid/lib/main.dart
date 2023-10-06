import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();

  Future fetchData() async {
    final Response response = await dio.get('https://pokeapi.co/api/v2/berry/');
    debugPrint(response.data.toString());
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetching Data'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return Text('Data: ${data.toString()}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
