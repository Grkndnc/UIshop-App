import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_shop_demo/components/my_button.dart';
import 'package:ui_shop_demo/models/product.dart';
import 'package:ui_shop_demo/models/shop.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});
// remove item method
  void removeItemFromCard(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Remove this item from the Card ?"),
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
                  context.read<Shop>().removeFromCard(product);
                },
              ),
            ],
          );
        });
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("User wants to pay Let's connect to  your backend!!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = context.watch<Shop>().card;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Card Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: card.isEmpty
                ? Center(child: Text("Your Card is empty...."))
                : ListView.builder(
                    itemCount: card.length,
                    itemBuilder: (context, index) {
                      final item = card[index];
                      return ListTile(
                        //imagepath buraya eklenecek!!!
                        leading: SizedBox(
                          width: 150,
                          child: Image.asset(
                            item.imagepath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCard(context, item),
                          icon: Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: MyButton(
              child: Text("Pay Now"),
              onTap: () => payButtonPressed(context),
            ),
          )
        ],
      ),
    );
  }
}
