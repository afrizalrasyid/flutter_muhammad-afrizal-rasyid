import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const Latihan());
}

class Latihan extends StatefulWidget {
  const Latihan({super.key});

  @override
  State<Latihan> createState() => _Latihan();
}

class _Latihan extends State<Latihan> {
  String email = '';
  String firstName = '';
  String lastName = '';

  final dio = Dio();
  var jsonList;

  var inputEmailControllers = TextEditingController();
  var inputFirstNameControllers = TextEditingController();
  var inputLastNameControllers = TextEditingController();

  Future fetchData() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');
      setState(() {
        jsonList = response.data['data'] as List;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future createData({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future updateData({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/5',
        data: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future deleteData() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/5',
      );
      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    createData(email: email, firstName: firstName, lastName: lastName);
    updateData(email: email, firstName: firstName, lastName: lastName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetching Data'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: inputEmailControllers,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onChanged: (String value) {
                    email = value;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: inputFirstNameControllers,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                  onChanged: (String value) {
                    firstName = value;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: inputLastNameControllers,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                  onChanged: (String value) {
                    lastName = value;
                  },
                ),
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            createData(
                                email: email,
                                firstName: firstName,
                                lastName: lastName);
                          },
                        );
                        inputEmailControllers.clear();
                        inputFirstNameControllers.clear();
                        inputLastNameControllers.clear();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Contact Created!'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: $email'),
                                  Text('First Name: $firstName'),
                                  Text('Last Name: $lastName'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Back'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('POST'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.deepPurple),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            updateData(
                                email: email,
                                firstName: firstName,
                                lastName: lastName);
                          },
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Contact Updated!'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: $email'),
                                  Text('First Name: $firstName'),
                                  Text('Last Name: $lastName'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Back'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('PUT'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.deepPurple),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            deleteData();
                          },
                        );
                        inputEmailControllers.clear();
                        inputFirstNameControllers.clear();
                        inputLastNameControllers.clear();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Contact Deleted!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Back'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('DELETE'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: jsonList.length,
                  itemBuilder: (BuildContext, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(jsonList[index]['email']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(jsonList[index]['first_name']),
                            Text(jsonList[index]['last_name']),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
