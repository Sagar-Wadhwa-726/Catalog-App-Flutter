// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors, deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;

  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // after any change made, the widget is rebuild, set the state also again using vxstate
    // state what is that thing on the happening of which the state should be rebuild
    // The below code specifies to listen addmutation to redraw the widget and change the ui.

    // Make it listen remove mutation also so that when the item removed form the final list, and after coming
    // back we can see the cart icon again instead of the tick button.
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // Check if the item pressed exists in the cart or not
    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      // all: whether that button is pressed or not
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      onPressed: (() {
        if (!isInCart) {
          // Add the catalog selected by the user in the cart
          AddMutation(catalog);
        }
      }),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
