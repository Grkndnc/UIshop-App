import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ui_shop_demo/models/product.dart';
import 'package:ui_shop_demo/models/shop.dart';

class MyPoductTile extends StatelessWidget {
  final Product? product;
  MyPoductTile({super.key, this.product});

  void addCard(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Add this item to the Card ?"),
            actions: [
              // Cancell Button
              MaterialButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              // Add to Card Button
              MaterialButton(
                child: Text("Yes"),
                onPressed: () {
                  // Pop the dialog
                  Navigator.pop(context);

                  // add to card
                  context.read<Shop>().addToCard(product!);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    product!.imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              //name
              Text(
                product!.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),

              // description
              Text(
                product!.description.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          //image

          //price + button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '£' " " + product!.price.toStringAsFixed(2),
              ),
              GestureDetector(
                onTap: () {
                  return addCard(context);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.secondary),
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
