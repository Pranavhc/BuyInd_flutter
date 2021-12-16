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
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(catalog.name),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        elevation: 1,
        backgroundColor: MyTheme.creameColor,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.only(right: 24),
        children: [
          "\$${catalog.price}".text.xl2.bold.color(Colors.black).make(),
          ElevatedButton(
            onPressed: () {},
            child: "Add to cart".text.xl.bold.make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ).wh(120, 40)
        ],
      )
          .backgroundColor(MyTheme.creameColor)
          .pOnly(left: 5, right: 5, top: 1, bottom: 1)
          .backgroundColor(MyTheme.creameColor),
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
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [MyTheme.creameColor, MyTheme.creameColor]),
                  ),
                  child: Column(
                    children: [
                      catalog.desc.text.xl2.bold.color(Colors.black).make(),
                      "To through condemned below so to deadly dote. Ye strange earthly than not bacchanals light might come. Shades he land and his revel drop long mote. Before deemed fly in worse one love save childe. Childe himnot alone but eremites. It he mirthful his all almost could."
                          .text
                          .color(Colors.grey.shade800)
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
