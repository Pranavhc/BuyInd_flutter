import 'package:buyind/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: "cart"
            .text
            .xl2
            .color(Theme.of(context).colorScheme.secondary)
            .make(),
        backgroundColor: Theme.of(context).cardColor,
        shadowColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
      ),
      body: Column(
        children: [
          Placeholder(),
          Divider(),
          
        ],
      ),
    );
  }
}
