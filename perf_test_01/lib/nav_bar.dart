import 'package:flutter/material.dart';
import 'package:perf_test_01/main.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedRoute,
      items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home))
      ],
      onTap: (value) {
        if (selectedRoute == value) {
          return;
        }

        setState(() {
          selectedRoute = value;
        });

        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(kRoutesList[value]);
      },
    );
  }
}
