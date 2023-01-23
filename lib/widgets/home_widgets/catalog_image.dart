// SEPERATED CLASS TO RETURN AN IMAGE
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .margin(const EdgeInsets.only(right: 10))
        .p16
        .color(context.canvasColor)
        .rounded
        .make()
        .w32(context);
  }
}
