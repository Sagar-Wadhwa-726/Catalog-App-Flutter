// Similar model as made for catalog previously
// ignore_for_file: unused_field, unnecessary_getters_setters, unnecessary_null_comparison

import 'package:flutter_application_1/models/catalog.dart';

// Singleton class, since earlier multiple objects were being created and each object has its own
// initial value which is different than the final value that we want.
class CartModel {
  static final CartModel cartModel = CartModel._internal();

  // Use factory constructor when we don't want to create a new instance of this class,
  // this will be returning the static object which was created for the first time.s
  factory CartModel() {
    return cartModel;
  }

  CartModel._internal();

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

  // Method to add items to the cart
  void addToCart(Items item) {
    _itemIds.add(item.id);
  }

  // Method to remove items from the cart
  void removeFromCart(Items item) {
    _itemIds.remove(item.id);
  }
}
