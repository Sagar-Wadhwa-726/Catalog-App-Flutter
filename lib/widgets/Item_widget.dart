// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

// This widget specifies how the items are to be shown, so provide it the items
class ItemWidget extends StatelessWidget {
  final Items item;

  const ItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
