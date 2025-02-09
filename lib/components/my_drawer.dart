import 'package:flutter/material.dart';
import 'package:ui_shop_demo/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(border: Border(bottom: BorderSide.none)),
                child: Icon(
                  Icons.shopping_basket_outlined,
                  size: 92,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                text: 'Card',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/card_page');
                },
              ),
            ],
          ),
          MyListTile(
            text: 'Log Out',
            icon: Icons.logout,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/intro_page',
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}
