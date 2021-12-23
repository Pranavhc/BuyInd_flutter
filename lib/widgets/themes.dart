import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThem {
  static Color creameColor = Color(0xfff2f2f2);

  static ThemeData get lightTheme => ThemeData(
        primaryColorBrightness: Brightness.light,
        cardColor: Colors.white,
        canvasColor: creameColor,
        colorScheme: ColorScheme.light(
          background: creameColor,
          brightness: Brightness.light,
          primary: Colors.white,
          secondary: Colors.black,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColorBrightness: Brightness.dark,
        cardColor: Colors.grey.shade900,
        canvasColor: Colors.black,
        colorScheme: ColorScheme.dark(
            background: creameColor,
            brightness: Brightness.dark,
            primary: Colors.black,
            secondary: Colors.white),
      );
}
