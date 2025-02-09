import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_shop_demo/components/my_drawer.dart';
import 'package:ui_shop_demo/components/product_tile.dart';
import 'package:ui_shop_demo/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //accsess product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          title: Center(
            child: Text('Shop Page'),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/card_page'),
                icon: Icon(Icons.shopping_cart_checkout_outlined))
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            //Shop Subtitle
            Center(
              child: Text(
                "Pick from a selected list of premium products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),

            // Product List
            SizedBox(
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  //get individual product from the shop
                  final product = products[index];
                  // return as a product tile UI
                  return MyPoductTile(
                    product: product,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
