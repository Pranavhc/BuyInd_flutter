import 'package:buyind/Utils/routes.dart';
import 'package:buyind/core/store.dart';
import 'package:buyind/models/cart.dart';
import 'package:buyind/models/catalog.dart';
import 'package:buyind/widgets/Home_Widgets/catalog_list.dart';
import 'package:buyind/widgets/Home_Widgets/drawer.dart';
import 'package:buyind/widgets/Home_Widgets/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/61c463b25763ef239c4c0b95";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
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
    final _cart = (VxState.store as MyStore).cart;

    return VxBuilder(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, store, status) => FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.cartPageRoute),
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(CupertinoIcons.cart),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ).p2().badge(
          color: Colors.cyan,
          size: 22,
          count: _cart.items.length,
          textStyle:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    );
  }

  homeBodySafeArea() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CatalogHeader(),
          if (CatalogModel.items.isNotEmpty)
            CatalogList().py16().expand()
          else
            CircularProgressIndicator().centered().expand(),
        ],
      ).pOnly(right: 16, top: 16, left: 16, bottom: 0),
    );
  }
}
