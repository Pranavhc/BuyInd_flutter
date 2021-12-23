import 'package:buyind/core/store.dart';
import 'package:buyind/widgets/Home_Widgets/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:buyind/Utils/is_logged_in.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/login_ui.dart';
import 'Pages/home_page.dart';
import 'Utils/routes.dart';
import 'Utils/google_SI_provider.dart';
import 'package:buyind/Pages/cart_page.dart';
import 'package:buyind/widgets/themes.dart';

initFireBase() async {
  // kIsWeb means the platform is website
  if (kIsWeb) {
    //to avoid "FirebaseOptions cannot be null" error.~
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDjX1lo-8PvJLANoY4_AzCk3NhP0F4mpJs",
        appId: "1:742176317489:web:04486ea88123bfe5b3f510",
        messagingSenderId: "742176317489",
        projectId: "buyind-be424",
      ),
    );
  } else //android doesn't demand "FirebaseOptions".
    await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFireBase();
  runApp(VxState(
    store: MyStore(),
    child: const BuyInd(),
  ));
}

class BuyInd extends StatelessWidget {
  const BuyInd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false, // debug banner visibility
              themeMode: themeProvider.themeMode,
              theme: MyThem.lightTheme,
              darkTheme: MyThem.darkTheme,
              routes: {
                '/': (context) => IsLoggedIn(),
                Routes.isLoggedInRoute: (context) => IsLoggedIn(),
                Routes.loginUiRoute: (context) => LoginPage(),
                Routes.homeRoute: (context) => HomePage(),
                Routes.cartPageRoute: (context) => CartPage(),
                Routes.homeDrawerRoute: (context) => HomeDrawer(),
              },
            );
          },
        ),
      );
}
