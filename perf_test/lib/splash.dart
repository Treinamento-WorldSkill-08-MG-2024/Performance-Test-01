import 'package:flutter/material.dart';
import 'package:perf_test/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomeScreen()));
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("SPlashSScreen"),);
  }
}