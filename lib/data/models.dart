
import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  spices,
  convenience,
  hygiene,
  sweets,
  other
}

class Category {
  const Category(this.name, this.color);

  final String name;
  final Color color;
}

class GroceryItem {
  GroceryItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category});

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
