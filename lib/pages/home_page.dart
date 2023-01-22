// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: (CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                // Specifies the number of items in each row
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridTile(
                      header: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        child: Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      footer: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      child: Image.network(item.image),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
