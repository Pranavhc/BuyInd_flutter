import 'package:buyind/models/catalog.dart';
import 'package:buyind/widgets/Home_Widgets/add_toCart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: Image.network(catalog.image)
            .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20)
            .box
            .rounded
            .square(100)
            .padding(EdgeInsets.all(5))
            .color(Theme.of(context).canvasColor)
            .make()
            .pOnly(top: 2, bottom: 2, left: 12, right: 24),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.xl
                .color(Theme.of(context).colorScheme.secondary)
                .make(),
            catalog.desc.text
                .color(Theme.of(context).colorScheme.secondary)
                .make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              buttonPadding: EdgeInsets.only(right: 24),
              children: [
                "\$${catalog.price}"
                    .text
                    .xl
                    .bold
                    .color(Theme.of(context).colorScheme.secondary)
                    .make(),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.deepPurpleAccent]),
                  ),
                  child: AddToCart(catalog: catalog),
                )
              ],
            ).pOnly(right: 8)
          ],
        ).p(context.isMobile ? 0 : 16),
      )
    ];
    return VxBox(
            child: context.isMobile
                ? Row(children: children2)
                : Column(children: children2))
        .color(Theme.of(context).cardColor)
        .rounded
        .square(120)
        .make()
        .p(5);
  }
}
