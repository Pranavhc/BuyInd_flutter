import 'package:buyind/models/catalog.dart';
import 'package:buyind/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(catalog.name),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        elevation: 1,
        backgroundColor: Theme.of(context).canvasColor,
        shadowColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.only(right: 24),
        children: [
          "\$${catalog.price}"
              .text
              .xl2
              .bold
              .color(Theme.of(context).colorScheme.secondary)
              .make()
              .p2(),
          ElevatedButton(
            onPressed: () {},
            child: "Add to cart"
                .text
                .lg
                .bold
                .color(Theme.of(context).colorScheme.secondary)
                .make()
                .p2(),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).canvasColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ).wh(120, 40)
        ],
      ).backgroundColor(Theme.of(context).cardColor),
      // .pOnly(left: 5, right: 5, top: 1, bottom: 1),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).p12().centered(),
            Expanded(
              child: VxArc(
                height: 10.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                  ),
                  child: Column(
                    children: [
                      catalog.desc.text.xl2.bold
                          .color(Theme.of(context).colorScheme.secondary)
                          .make(),
                      "To through condemned below so to deadly dote. Ye strange earthly than not bacchanals light might come. Shades he land and his revel drop long mote. Before deemed fly in worse one love save childe. Childe himnot alone but eremites. It he mirthful his all almost could."
                          .text
                          .color(Theme.of(context).colorScheme.secondary)
                          .lg
                          .center
                          .caption(context)
                          .make()
                          .p16()
                    ],
                  ).py32(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
