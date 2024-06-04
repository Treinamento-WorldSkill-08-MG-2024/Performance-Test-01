import 'package:flutter/material.dart';
import 'package:perf_test/main.dart';

class BottomNavAppBar extends StatefulWidget {
  const BottomNavAppBar({super.key});

  @override
  State<BottomNavAppBar> createState() => _BottomNavAppBarState();
}

class _BottomNavAppBarState extends State<BottomNavAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedRoute,
      items: const [
        BottomNavigationBarItem(label: 'Route', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Route', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Route', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Route', icon: Icon(Icons.home)),
      ],
      onTap: (index) {
        if (selectedRoute == index) {
          return;
        }

        setState(() {
          selectedRoute = index;
        });

        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(kRoutesList[index]);
      },
    );
  }
}
