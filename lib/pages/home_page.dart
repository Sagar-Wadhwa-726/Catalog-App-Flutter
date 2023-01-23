// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';

import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

// Converted HomePage to stateful widget since on the home page firstly data will
// loaded and then the data will be displayed, it is not static / hard coded data
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  // override the init method. When the class is initialised this method is called (before build).
  // Till now the widget has not been created but its state will be initilaised to new state from this
  // method. Since this method is called before build, we can pass the data from initState to build

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    // root bundle: to load the resources from an external file
    // returns a future (after some time) so await for the data
    // since await has to be used make this function async
    // catalogJson is a string
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // encode: object -> string
    // decode: string -> object
    final decodedData = jsonDecode(catalogJson);

    // since we want only the products' data and not the whole json object
    // productsData will be in the form of a map (8 items total)
    final productsData = decodedData["products"];

    // create objects of type Items and store all the objects in the list
    CatalogModel.items = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();

    // call the build method again
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a widget, material is a widget
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(
          CupertinoIcons.cart_fill,
          color: Colors.white,
        ),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py20().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
