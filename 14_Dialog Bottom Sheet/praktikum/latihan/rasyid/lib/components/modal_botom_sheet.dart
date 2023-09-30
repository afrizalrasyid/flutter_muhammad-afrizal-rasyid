import 'package:flutter/material.dart';
import 'package:rasyid/detail_image.dart';
import 'package:rasyid/main.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: MyApp.detailImage(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DetailImage()),
                );
              },
              child: const Text('ya'))
        ],
      ),
    );
  }
}
