import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/models/product_model.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/methods.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/red_screen.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<State> _filterKey = GlobalKey<State>();
  final List<String> _labels = <String>["Products"];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(width: .5, color: white)),
          child: TextField(
            onChanged: (String value) => _filterKey.currentState!.setState(() {}),
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
        Expanded(
          child: StatefulBuilder(
            key: _filterKey,
            builder: (BuildContext context, void Function(void Function()) _) {
              return FutureBuilder<List<ProductModel>>(
                future: loadProducts(),
                builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      final List<ProductModel> products = snapshot.data!.where((ProductModel element) => element.productName.startsWith(_searchController.text.trim())).toList();
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .85),
                        itemBuilder: (BuildContext context, int index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 150,
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: <BoxShadow>[BoxShadow(color: pink.withOpacity(.3), blurStyle: BlurStyle.outer, offset: const Offset(2, 2))],
                                image: const DecorationImage(image: AssetImage("assets/pictures/me.jpeg"), fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if (Random().nextBool())
                                    Chip(
                                      backgroundColor: pink,
                                      elevation: 8,
                                      padding: const EdgeInsets.all(4),
                                      shadowColor: pink.withOpacity(.3),
                                      avatar: const Icon(FontAwesome.crown_solid, size: 15, color: Colors.yellow),
                                      label: const Text(" MOST SELLED", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                                    ),
                                  const Spacer(),
                                  Chip(
                                    backgroundColor: pink,
                                    elevation: 8,
                                    padding: const EdgeInsets.all(4),
                                    shadowColor: pink.withOpacity(.3),
                                    label: Text(products[index].productPrice, style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Flexible(child: Text(products[index].productName, style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)))
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
              );
            },
          ),
        ),
      ],
    );
  }
}
