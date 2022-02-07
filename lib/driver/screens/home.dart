import 'package:flutter/material.dart';
import 'package:oil/driver/widgets/order.dart';
import 'package:oil/driver/widgets/profile.dart';

class Home extends StatefulWidget
{
  static const routeName = '/driver/nav';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> screens = const <Widget>[
    Order(),
    Profile()
  ];
  int screenIndex = 0;

  bottomTap (int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的"
          ),
        ],
        currentIndex: screenIndex,
        onTap: bottomTap,
      ),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240)
    );
  }
}