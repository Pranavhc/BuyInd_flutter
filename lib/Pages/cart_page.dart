import 'dart:math';
import 'package:buyind/core/store.dart';
import 'package:buyind/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: "cart"
            .text
            .xl2
            .color(Theme.of(context).colorScheme.secondary)
            .make(),
        backgroundColor: Theme.of(context).cardColor,
        shadowColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
      ),
      body: Column(
        children: [
          _CartList().p24().expand(),
          Divider(
            height: sqrt1_2,
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}".text.xl2.bold.make();
            },
          ),
          WidthBox(30),
          Container(
            height: 40,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.deepPurpleAccent]),
            ),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      ":( Hey I'm learning, do not expect such functionality this early from me and be honest with me, do you even have that much money on you?"
                          .text
                          .color(Theme.of(context).colorScheme.secondary)
                          .make(),
                  backgroundColor: Theme.of(context).cardColor,
                ));
              },
              child: "Buy".text.xl.color(Colors.white).semiBold.make().p8(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(StadiumBorder()),
                minimumSize: MaterialStateProperty.all(Size(80, 40)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "No Items Added".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(CupertinoIcons.cart_fill_badge_minus),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text.make().p2(),
            ),
          );
  }
}
