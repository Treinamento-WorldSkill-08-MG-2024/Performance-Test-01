import 'package:flutter/material.dart';
import 'package:perf_test/home.dart';
import 'package:perf_test/splash.dart';

void main() {
  runApp(const MainApp());
}

// App Route
const kHomeRoute = "home";
const kRoutesList = [kHomeRoute, kHomeRoute, kHomeRoute];
var selectedRoute = 0;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        kHomeRoute: (_) => const HomeScreen(),
      },
    );
  }
}
