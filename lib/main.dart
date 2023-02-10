import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_application_test/Counter.dart';
import 'package:flutter_application_test/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  static int get numbercounterfinal => 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto UCamp 1'),
        backgroundColor: Color.fromARGB(255, 2, 16, 62),
      ),
      //BUTTON NAVIGATION BAR
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          Counter(numbercounterfinal),
          Settings(
            title: '',
          ),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  //SETTINGS BUTTON
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Counter.png'),
                    fit: BoxFit.cover)),
          ),
          title: 'Contador'),
      //COUNTER BUTTON
      PersistentBottomNavBarItem(
          icon: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Gear.png'), fit: BoxFit.cover)),
          ),
          title: 'Ajustes'),
    ];
    //SELECTION CHANGE ON OTHER ICONS
  }
}
