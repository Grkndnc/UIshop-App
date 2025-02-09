import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_shop_demo/models/shop.dart';
import 'package:ui_shop_demo/pages/card_page.dart';
import 'package:ui_shop_demo/pages/intro_page.dart';
import 'package:ui_shop_demo/pages/shop_page.dart';
import 'package:ui_shop_demo/themes/themes.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: appTheme,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/card_page': (context) => CardPage(),
      },
    );
  }
}
