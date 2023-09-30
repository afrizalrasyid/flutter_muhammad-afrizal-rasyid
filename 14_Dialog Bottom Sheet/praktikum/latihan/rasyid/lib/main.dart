import 'package:flutter/material.dart';
import 'package:rasyid/components/modal_botom_sheet.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Images dengan file'),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => const ShowBottomSheet(),
                  );
                },
                child: detailImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget detailImage() {
    return const Image(
      image: AssetImage('assets/images/carousel_1.jpg'),
    );
  }
}
