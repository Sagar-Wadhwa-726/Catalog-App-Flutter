// SEPERATED CLASS FOR CATALOG HEADER
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // So that items start from the very lHS
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Same as Text("Catalog App") :) Magic of VelocityX
        "Catalog App".text.xl5.bold.color(context.accentColor).make(),
        "Trending Products".text.xl2.color(context.accentColor).make(),
      ],
    );
  }
}
