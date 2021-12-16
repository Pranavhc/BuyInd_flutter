// ignore_for_file: prefer_const_constructors
import 'package:buyind/Pages/cart_page.dart';
import 'package:buyind/Utils/is_logged_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/home_page.dart';
import 'Pages/login_ui.dart';
import 'Utils/google_SI_provider.dart';
import 'Utils/routes.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart' show kIsWeb;

initFireBase() async {
  // kIsWeb means the platform is website
  if (kIsWeb) {
    //to avoid "FirebaseOptions cannot be null" error
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyDjX1lo-8PvJLANoY4_AzCk3NhP0F4mpJs",
      appId: "1:742176317489:web:04486ea88123bfe5b3f510",
      messagingSenderId: "742176317489",
      projectId: "buyind-be424",
    ));
  } else //android doesn't demand "FirebaseOptions"
    await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFireBase();
  runApp(const BuyInd());
}

class BuyInd extends StatelessWidget {
  const BuyInd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // debug banner visibility
        themeMode: ThemeMode.light,
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            primaryColorLight: Colors.deepPurple),
        darkTheme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        routes: {
          '/': (context) => IsLoggedIn(),
          Routes.isLoggedInRoute: (context) => IsLoggedIn(),
          Routes.loginUiRoute: (context) => LoginPage(),
          Routes.homeRoute: (context) => HomePage(),
          Routes.cartPageRoute: (context) => CartPage(),
        },
      ),
    );
  }
}
