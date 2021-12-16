import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

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
            .fontWeight(FontWeight.w900)
            .color(Colors.deepPurpleAccent)
            .make()
            .pOnly(right: 8),
        "Trending Products".text.xl3.gray500.make(),
      ],
    );
  }
}
