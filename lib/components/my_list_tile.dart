import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  void Function()? onTap;
  MyListTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey.shade700,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
