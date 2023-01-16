import 'package:flutter/material.dart';
import 'package:preferences_app_plantilla/preferences/preferences.dart';

import '../screens/screens.dart';

class BotMenu extends StatefulWidget {
  const BotMenu({Key? key}) : super(key: key);
  @override
  State<BotMenu> createState() => _BotMenuState();
}

class _BotMenuState extends State<BotMenu> {
  static int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, LoginScreen.routerName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, SettingsScreen.routerName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ColorScreen.routerName);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      /*backgroundColor: Color.fromARGB(Preferences.color[0],
          Preferences.color[1], Preferences.color[2], Preferences.color[3]),*/
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.color_lens),
          label: 'Color',
        ),
      ],
      currentIndex: _selectedIndex,
      //selectedItemColor: Color.fromARGB(162, 0, 255, 34),
      onTap: _onItemTapped,
    );
  }
}
