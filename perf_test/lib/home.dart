import 'package:flutter/material.dart';
import 'package:perf_test/bottom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Home"),
      bottomNavigationBar: BottomNavAppBar(),
    );
  }
}
