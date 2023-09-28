import 'package:flutter/material.dart';
import 'package:rasyid/detail_image.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Image(
            height: 200,
            image: AssetImage('assets/images/carousel_1.jpg')
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DetailImage()),
              );
            }, 
            child: const Text('ya')
          )
        ],
      ),
    );
  }
}