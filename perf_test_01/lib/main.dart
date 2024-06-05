import 'package:flutter/material.dart';
import 'package:perf_test_01/home.dart';
import 'package:perf_test_01/splash.dart';

void main() {
  runApp(const MainApp());
}

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
