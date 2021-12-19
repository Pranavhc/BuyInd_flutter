import 'package:buyind/Utils/routes.dart';
import 'package:buyind/widgets/Home_Widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 33,    
      child: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(CupertinoIcons.bars),
            onPressed: () => Scaffold.of(context).openDrawer(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "BuyInd".text.xl2.bold.color(Colors.deepPurpleAccent).center.make(),
            "Trending Products".text.xl2.gray500.center.make().pOnly(left: 5),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
    );
  }
}
