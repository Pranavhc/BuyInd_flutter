// ignore_for_file: unused_local_variable

import 'package:buyind/core/store.dart';
import 'package:buyind/models/cart.dart';
import 'package:buyind/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      child: isInCart
          ? Icon(
              Icons.done,
              color: Colors.white,
            )
          : Icon(CupertinoIcons.cart, color: Colors.white),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(70, 40)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }
}
