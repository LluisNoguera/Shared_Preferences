import 'package:flutter/material.dart';
import 'package:preferences_app_plantilla/preferences/preferences.dart';
import 'package:preferences_app_plantilla/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: LoginScreen.routerName,
        routes: {
          LoginScreen.routerName: (_) => const LoginScreen(),
          SettingsScreen.routerName: (_) => const SettingsScreen(),
          ColorScreen.routerName: (_) => const ColorScreen(),
        },
        theme: Provider.of<ThemeProvider>(context).currentTheme);
  }
}
