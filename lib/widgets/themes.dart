// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

//   //colors
//   static Color creameColor = Color(0xfff5f5f5);
//   static Color darkcreameColor = Colors.grey.shade900;
//   static Color darkBluishColor = Color(0xff403b58);
//   static Color lighBluishColor = Color(0xff403b58);
//   static Color darkPurple = Colors.purple.shade400;

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
