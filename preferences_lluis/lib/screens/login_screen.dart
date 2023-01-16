import 'package:flutter/material.dart';
import 'package:preferences_app_plantilla/preferences/preferences.dart';
import 'package:preferences_app_plantilla/providers/theme_provider.dart';
import 'package:preferences_app_plantilla/screens/screens.dart';
import 'package:preferences_app_plantilla/widgets/bot_nav_bar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routerName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          /*backgroundColor: Color.fromARGB(
                  Preferences.color[0],
                  Preferences.color[1],
                  Preferences.color[2],
                  Preferences.color[3]),*/
        ),
        bottomNavigationBar: const BotMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dades de l\' usuari:',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.nom,
                    onChanged: (value) {
                      Preferences.nom = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'Nom', helperText: 'Nom de l\'usuari'),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.userName,
                    onChanged: (value) {
                      Preferences.userName = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Nom d\'usuari',
                      helperText: 'Alias de l\'usuari',
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.password,
                    obscureText: true,
                    onChanged: (value) {
                      Preferences.password = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Center(
                      child: FloatingActionButton(
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SettingsScreen.routerName);
                        },
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
