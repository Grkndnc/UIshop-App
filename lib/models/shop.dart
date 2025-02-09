import 'package:flutter/material.dart';
import 'package:ui_shop_demo/models/product.dart';

class Shop extends ChangeNotifier {
// Product for sale
  final List<Product> _shop = [
    Product(
        name: "Product 1",
        description: "description",
        price: 1213,
        imagepath: "assets/ayakkabici.jpg"),
    Product(
        name: "Product 2",
        description: "description",
        price: 1233,
        imagepath: "assets/kahvedukkani.jpg"),
    Product(
        name: "Product 3",
        description: "description",
        price: 1223,
        imagepath: "assets/pantalonlar.jpg"),
    Product(
        name: "Product 4",
        description: "description",
        price: 1232,
        imagepath: "assets/pastahane.jpg"),
  ];

// user cart
  final List<Product> _card = [];

// get product list
  List<Product> get shop => _shop;
//get user card
  List<Product> get card => _card;

// add item to the card
  void addToCard(Product item) {
    _card.add(item);
    notifyListeners();
  }

// remove item from the card
  void removeFromCard(Product item) {
    _card.remove(item);
    notifyListeners();
  }
}
