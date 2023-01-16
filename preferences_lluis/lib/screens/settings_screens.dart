import 'package:flutter/material.dart';
import 'package:preferences_app_plantilla/preferences/preferences.dart';
import 'package:preferences_app_plantilla/providers/theme_provider.dart';
import 'package:preferences_app_plantilla/widgets/bot_nav_bar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color color = Color.fromARGB(Preferences.color[0], Preferences.color[1],
      Preferences.color[2], Preferences.color[3]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          /*backgroundColor: Color.fromARGB(Preferences.color[0],
              Preferences.color[1], Preferences.color[2], Preferences.color[3]),*/
          title: const Text('Home'),
        ),
        bottomNavigationBar: const BotMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
                value: Preferences.isDarkMode,
                title: const Text('Dark Mode'),
                onChanged: (value) {
                  Preferences.isDarkMode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                }),
            Divider(),
            Text('Dark Mode: ${Preferences.isDarkMode}'),
            Divider(),
            Text('Gènere: ${Preferences.genere}'),
            Divider(),
            Text('Nom d\'usuari: ${Preferences.nom}'),
            Divider(),
            Text('Color seleccionat: A:${color}'),
          ],
        ));
  }
}
