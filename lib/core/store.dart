// ignore_for_file: public_member_api_docs, sort_constructors_first
// We can create our own store here
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';

// Store can carry all the operations that are being done in our application. The store
// has all the information and it is the responsibility of the store to handle everything
class MyStore extends VxStore {
  // Create the object of the models we want to manipulate
  late CatalogModel catalog;
  late CartModel cart;
  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
