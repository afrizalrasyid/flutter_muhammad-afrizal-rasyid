import 'package:flutter/material.dart';
import 'package:rasyid/galeri.dart';
import 'package:rasyid/list_contact.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Minggu Ke-7'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ListContact(),
                    ),
                  );
                },
                child: const Text('Contact'),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Galeri(),
                    ),
                  );
                },
                child: const Text('Galeri'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
