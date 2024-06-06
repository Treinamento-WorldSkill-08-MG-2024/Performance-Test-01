import 'dart:convert';

import 'package:apis_01/modules/cats_api.dart';
import 'package:apis_01/modules/fred_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MainApp());
}

// Users don't work anymore
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<CatFactsModel> _futureCatFacts;
  late Future<List<UserModel>> _futureUsers;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);

    final userApi = UsersApi();

    _futureUsers = userApi.getUsers();
    _futureCatFacts = CatApi().getFact();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                FutureBuilder<CatFactsModel>(
                  future: _futureCatFacts,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Failed ${snapshot.error}");
                    }

                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Text("Data: ${snapshot.data!.fact}");
                    }

                    return const CircularProgressIndicator();
                  },
                ),
             
                FutureBuilder<List<UserModel>>(
                  future: _futureUsers,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Failed ${snapshot.error}");
                    }

                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final data = snapshot.data!;

                      return Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Text(data[index].name),
                              Image.memory(base64Decode(data[index].image.split(',').last))
                            ],
                          ),
                        ),
                      );
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
