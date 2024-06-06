import 'package:apis_01/modules/cats_api.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<CatFactsModel> _futureCatFacts;

  @override
  void initState() {
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
            child: FutureBuilder<CatFactsModel>(
              future: _futureCatFacts,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Failed ${snapshot.error}");
                }
          
                if (snapshot.hasData) {
                  return Text("Data: ${snapshot.data!.fact}");
                }
          
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
