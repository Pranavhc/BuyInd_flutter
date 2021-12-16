import 'package:buyind/models/catalog.dart';
import 'package:buyind/widgets/Home_Widgets/poduct_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/container.dart';
import 'package:velocity_x/src/flutter/padding.dart';

import '../themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.white,
          borderRadius: BorderRadius.circular(30),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(catalog: catalog),
              )),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(
            catalog.image,
          )
              .box
              .roundedLg
              .square(100)
              .padding(EdgeInsets.all(10))
              .color(MyTheme.creameColor)
              .make()
              .pOnly(top: 0, bottom: 0, left: 12, right: 24),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.color(Colors.black).make(),
              catalog.desc.text.color(Colors.black).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonPadding: EdgeInsets.only(right: 24),
                children: [
                  "\$${catalog.price}".text.xl.bold.color(Colors.black).make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Add to cart".text.bold.make(),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(70, 40)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                  )
                ],
              ).pOnly(right: 8)
            ],
          ),
        )
      ],
    ))
        .color(Colors.white)
        .roundedLg
        .square(130)
        .make()
        .pOnly(bottom: 2, top: 5, right: 0, left: 0);
  }
}
