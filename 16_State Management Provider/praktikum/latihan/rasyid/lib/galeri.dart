import 'package:flutter/material.dart';
import 'package:rasyid/components/modal_botom_sheet.dart';

void main() {
  runApp(const MaterialApp(
    home: Galeri(),
  ));
}

class Galeri extends StatelessWidget {
  const Galeri({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Galeri'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('List Galeri'),
              SizedBox(
                height: 500,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const ShowBottomSheet());
                      },
                      child: detailImage(),
                    ),
                    const Image(
                      image: AssetImage('assets/images/carousel_3.jpg'),
                    ),
                    const Image(
                      image: AssetImage('assets/images/carousel_4.jpg'),
                    ),
                    const Image(
                      image: AssetImage('assets/images/carousel_5.jpg'),
                    ),
                  ],
                ),
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
