// ignore_for_file: prefer_const_constructors
import 'package:buyind/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // made up delay. usually data gets collected through internet and it might take some time.
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "BuyInd"
            .text
            .xl3
            .bold
            .color(Colors.deepPurpleAccent)
            .make()
            .pOnly(right: 8),
        "Trending Products".text.xl3.gray500.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        Image.network(
          catalog.image,
        ).box.roundedLg.square(100).p12.color(Colors.white).make().p12(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(Colors.white).make(),
              catalog.desc.text.color(Colors.white).make(),
              // 10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.start,
                buttonPadding: EdgeInsets.only(right: 24),
                children: [
                  "\$${catalog.price}".text.xl.bold.color(Colors.white).make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.bold.make(),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple),
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
        .black
        .roundedLg
        .square(140)
        .make()
        .pOnly(bottom: 10, top: 10, right: 0, left: 0);
  }
}
