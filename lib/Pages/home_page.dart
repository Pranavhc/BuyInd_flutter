import 'package:buyind/Utils/routes.dart';
import 'package:buyind/models/catalog.dart';
import 'package:buyind/widgets/Home_Widgets/catalog_list.dart';
import 'package:buyind/widgets/Home_Widgets/drawer.dart';
import 'package:buyind/widgets/Home_Widgets/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
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
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: homeScaffoldFloatingActionButton(),
      body: homeBodySafeArea(),
      drawer: HomeDrawer(),
    );
  }

//----------------------------------------Functions
  homeScaffoldFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, Routes.cartPageRoute),
      elevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Icon(CupertinoIcons.cart),
      backgroundColor: Theme.of(context).canvasColor,
      foregroundColor: Theme.of(context).colorScheme.secondary,
    ).p12();
  }

  homeBodySafeArea() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().expand(),
          ],
        ),
      ),
    );
  }
}
