import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:preferences_app_plantilla/preferences/preferences.dart';
import 'package:preferences_app_plantilla/widgets/bot_nav_bar.dart';

class ColorScreen extends StatefulWidget {
  static const String routerName = 'color';

  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  static Color pickerColor = Color.fromARGB(100, 200, 50, 50);
  static late Color currentColor;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(Preferences.color[0],
              Preferences.color[1], Preferences.color[2], Preferences.color[3]),
          title: const Text('Color Picker'),
        ),
        bottomNavigationBar: const BotMenu(),
        body: Column(children: [
          ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              currentColor = Color.fromARGB(
                  Preferences.color[0],
                  Preferences.color[1],
                  Preferences.color[2],
                  Preferences.color[3]);
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ]));
  }
}
