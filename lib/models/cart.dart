// Similar model as made for catalog previously
// ignore_for_file: unused_field, unnecessary_getters_setters, unnecessary_null_comparison

import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  // Catalog field
  late CatalogModel _catalog;

  // Collection of ids added into the cart. Store id of each item added to cart
  final List<int> _itemIds = [];

  // Getter for _catalog
  CatalogModel get catalog => _catalog;

  // Setter for _catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get the items in the cart, creating a list of items objects to be displayed on the final page
  List<Items> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get the total price
  num get totalPrice => items.fold(
      0, (totalValue, currentValue) => totalValue + currentValue.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Items item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Items item;
  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
