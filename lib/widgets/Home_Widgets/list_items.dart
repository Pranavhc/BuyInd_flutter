import 'package:buyind/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
              .box
              .roundedLg
              .square(100)
              .padding(EdgeInsets.all(10))
              .color(Theme.of(context).canvasColor)
              .make()
              .pOnly(top: 0, bottom: 0, left: 12, right: 24),
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
                  ElevatedButton(
                    onPressed: () {},
                    child: "Add to cart"
                        .text
                        .bold
                        .color(Theme.of(context).colorScheme.secondary)
                        .make(),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(70, 40)),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).canvasColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                  )
                ],
              ).pOnly(right: 8)
            ],
          ),
        )
      ]),
    )
        .color(Theme.of(context).cardColor)
        .roundedLg
        .square(130)
        .make()
        .pOnly(bottom: 2, top: 5, right: 0, left: 0);
  }
}
