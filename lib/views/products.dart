import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            prefixIcon: Icon(Bootstrap.search, size: 15, color: white),
            contentPadding: EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
