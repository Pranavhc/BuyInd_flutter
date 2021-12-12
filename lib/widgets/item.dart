// ignore_for_file: prefer_const_constructors
import 'package:buyind/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[300],
      child: ListTile(
        // onTap: ,
        leading: Image.network(item.image),
        title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
