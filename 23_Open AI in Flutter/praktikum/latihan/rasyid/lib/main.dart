import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Chatbot());
}

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  List<String> messages = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();

  Future<void> _submitForm() async {
    String key = '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';
    if (_formKey.currentState!.validate()) {
      final apiKey = key;
      const apiUrl = 'https://api.openai.com/v1/completions';

      List<Map<String, dynamic>> jsonDataList = [
        {
          'name': 'Vivo V29e',
          'storage': '256 GB',
          'price': 'Rp 3.873.000',
        },
        {
          'name': 'Infinix Zero 30',
          'storage': '256 GB',
          'price': 'Rp 2.990.000',
        },
        {
          'name': 'Infinix Zero 30 5G',
          'storage': '256 GB',
          'price': 'Rp 4.175.000',
        },
        {
          'name': 'Xiaomi 13T',
          'storage': '256 GB',
          'price': 'Rp 6.299.000',
        },
        {
          'name': 'Vivo Y17s',
          'storage': '128 GB',
          'price': 'Rp 1.770.000',
        },
        {
          'name': 'Vivo V29 5G',
          'storage': '256 GB',
          'price': 'Rp 6.449.000',
        },
        {
          'name': 'Realme 11',
          'storage': '256 GB',
          'price': 'Rp 3.118.000',
        },
        {
          'name': 'Infinix GT 10 Pro',
          'storage': '256 GB',
          'price': 'Rp 3.179.000',
        },
        {
          'name': 'Realme C51',
          'storage': '64 GB',
          'price': 'Rp 1.343.000',
        },
        {
          'name': 'Redmi 12',
          'storage': '128 GB',
          'price': 'Rp 1.914.700',
        },
      ];

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(
          <String, dynamic>{
            'model': 'text-davinci-003',
            'prompt': _textController.text + '' + jsonEncode(jsonDataList),
            'max_tokens': 50,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String userMessage = _textController.text;
        String chatbotMessage = responseData['choices'][0]['text'];

        setState(() {
          messages.add(userMessage);
          messages.add(chatbotMessage);
          _textController.clear();
        });
      } else {
        print('Print failed. Failed to get response: ${response.statusCode}');
      }
    } else {
      print('Insert Value');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 13, 18),
          title: const Text('M-Assistant'),
        ),
        body: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final isUserMessage = index % 2 == 0;
                    return ListTile(
                      title: Align(
                        alignment: isUserMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: isUserMessage
                                ? const Color.fromARGB(255, 24, 61, 61)
                                : const Color.fromARGB(255, 4, 13, 18),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            messages[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 95,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          hintText: 'Type a message',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          _submitForm();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
