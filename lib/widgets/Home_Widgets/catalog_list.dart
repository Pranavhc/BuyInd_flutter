import 'package:buyind/models/catalog.dart';
import 'package:buyind/widgets/Home_Widgets/poduct_details.dart';
import 'package:flutter/material.dart';
import 'list_items.dart';

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
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
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
