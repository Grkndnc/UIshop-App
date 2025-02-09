import 'package:flutter/material.dart';
import 'package:ui_shop_demo/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_basket_outlined,
              size: 92,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Text(
              'Minimal Shop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Preminium Quality Products',
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
