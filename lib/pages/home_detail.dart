// ignore_for_file: prefer_const_constructors, deprecated_member_use

/*The user will be redirected to this page whenever the user selects 
an item, so we will be needing all the details of that particular item */
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetails extends StatelessWidget {
  final Items catalog;
  const HomeDetails({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog),
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Center(child: Image.network(catalog.image)),
            ).h32(context).py16(),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .color(context.accentColor)
                          .make(),
                      10.heightBox,
                      "Des gezagt schmilzt schon und sanft, oft gut bäume du sanft hab mir's teuren herzen, zurück so schnee denkst gehn der dich du du hast. Der was wo glaube zurück mutter grambefangen, wo darfst es darfst gut wo deine lange, der sanken muß mit die sanftes bester jedoch und heimat jedoch und heimat jedoch und"
                          .text
                          .size(13)
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py32(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
