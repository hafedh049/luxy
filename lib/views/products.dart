import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/models/product_model.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/red_screen.dart';

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
          children: <Widget>[for (final String label in _labels) Chip(label: Text(label, style: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)))],
        ),
        const SizedBox(height: 20),
        const Text("FEATURED PRODUCTS", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        FutureBuilder<List<ProductModel>>(
          future: null,
          builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 200,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: <BoxShadow>[BoxShadow(color: pink.withOpacity(.3), blurStyle: BlurStyle.outer, offset: const Offset(2, 2))]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("NO PRODUCTS YET", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 2)));
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            }
            return RedScreenOfDeath(error: snapshot.error.toString());
          },
        ),
      ],
    );
  }
}
