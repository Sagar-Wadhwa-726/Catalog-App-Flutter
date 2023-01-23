// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.xl3.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

/*Wheneve an item is removed from the cart, the total price should also chagne. for this we can listen to 
mutation but the problem is that whenever vxstate listens for mutation, it will rebuild the whole widget tree
But we want only the price widget should change. This app will not have performance issues with the naive approach
but bigger application will have more impact when we rebuild the whole widget tree without any need. To resolve this 
issue, we can wrap the price around a widget known as VxConsumer which will be taking some mutations as the parameter
*/
class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Listen to some notifications, or whenever some mutation happens
          VxConsumer(
            builder: ((context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            }),
            mutations: {RemoveMutation},
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(context.theme.buttonColor)),
            onPressed: (() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet.".text.make()),
              );
            }),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

// STATEFUL WIDGET: SINCE WE CAN REMOVE THE ITEMS FROM THE CART SO IT WILL BE DYNAMIC IN NATURE

// Vxstate is always listening whenever remove mutation is used, this will help to redraw the widget after internally
// actually the item has been removed from the list.
class _CartList extends StatelessWidget {
  // object of class CartModel
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show here !".text.xl2.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    onPressed: () => RemoveMutation(_cart.items[index]),
                    icon: Icon(Icons.remove_shopping_cart_outlined),
                  ),
                  title: _cart.items[index].name.text.make(),
                )),
          );
  }
}
