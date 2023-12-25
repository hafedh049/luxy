import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _labels = <String>[];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            prefixIcon: const Icon(Bootstrap.search, size: 15, color: white),
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: IconButton(
              onPressed: () => _searchController.clear(),
              icon: const Icon(Bootstrap.x_diamond, size: 15, color: white),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (final String label in _labels) Chip(label: Text(label, style: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500))),
          ],
        ),
        const SizedBox(height: 20),
        const Text("FEATURED PRODUCTS", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
      ],
    );
  }
}
