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

/// Project setup took: 13m 20s
/// Login page took: 11m 02s
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
