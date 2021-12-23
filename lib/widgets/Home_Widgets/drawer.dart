import 'package:buyind/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ChangeThemeWidget(),
        ],
      ),
    );
  }
}

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SafeArea(
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Dark Mode".text.bold.make().p32(),
                Switch.adaptive(
                  activeColor: Colors.deepPurpleAccent,
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.toggleTheme(value);
                  },
                ).p32(),
              ],
            ),
          ).p16(),
        ),
      ],
    );
  }
}
