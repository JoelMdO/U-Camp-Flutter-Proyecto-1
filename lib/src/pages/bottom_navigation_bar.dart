import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/pages/counter.dart';
import 'package:flutter_application_test/src/pages/settings.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required this.currentIndex, required this.numbercounterfinal})
      : super(key: key);

  final int currentIndex;
  final int numbercounterfinal;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Counter'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[900],
      onTap: (index) {
        if (currentIndex == 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => Counter(numbercounterfinal)),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Settings()),
          );
        }
      },
    );
  }
}
