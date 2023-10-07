import 'package:flutter/material.dart';
import 'package:rasyid/detail_image.dart';
import 'package:rasyid/galeri.dart';

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
            child: Galeri.detailImage(),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DetailImage()),
                  );
                },
                child: const Text('Ya'),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tidak'),
              )
            ],
          )
        ],
      ),
    );
  }
}
