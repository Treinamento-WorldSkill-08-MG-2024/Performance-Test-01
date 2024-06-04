import 'package:flutter/material.dart';
import 'package:perf_test/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("SPlashSScreen"),);
  }
}