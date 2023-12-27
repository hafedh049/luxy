import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final PageController _productController = PageController();
  final GlobalKey<State> _indicatorKey = GlobalKey<State>();
  final GlobalKey<State> _quantityKey = GlobalKey<State>();

  int _activeIndex = 0;
  final List<String> _sizes = <String>["XS", "S", "M", "L", "XL"];
  String _selectedSize = "XL";
  int _quantity = 1;
  @override
  void dispose() {
    _productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: 4,
                onPageChanged: (int value) {
                  _indicatorKey.currentState!.setState(() => _activeIndex = value);
                },
                itemBuilder: (BuildContext context, int index) => Center(
                  child: Image.asset("assets/pictures/me.jpeg", width: MediaQuery.sizeOf(context).width * .7),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: StatefulBuilder(
                key: _indicatorKey,
                builder: (BuildContext context, void Function(void Function()) _) {
                  return AnimatedSmoothIndicator(
                    activeIndex: _activeIndex,
                    count: 4,
                    duration: 500.ms,
                    effect: const WormEffect(dotColor: grey, dotHeight: 6, dotWidth: 12, radius: 2, activeDotColor: pink, spacing: 6.0),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text("Product name", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            const Text("80 TND", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            const Divider(height: 1, thickness: 1, color: grey),
            const SizedBox(height: 10),
            const Text("Description", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            const Text("Size", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Row(
                  children: <Widget>[
                    for (final String size in _sizes)
                      GestureDetector(
                        onTap: () {
                          if (_selectedSize != size) {
                            _(() => _selectedSize = size);
                          }
                        },
                        child: AnimatedContainer(
                          width: 40,
                          height: 40,
                          duration: 500.ms,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: _selectedSize == size ? pink : null, shape: BoxShape.circle, border: Border.all(color: pink)),
                          child: Text(size, style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const Text("Quantity", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          if (_quantity > 1) {
                            _quantityKey.currentState!.setState(() => _quantity -= 1);
                          }
                        },
                        icon: const Icon(FontAwesome.minus_solid, size: 15, color: white),
                      ),
                      const SizedBox(width: 10),
                      StatefulBuilder(
                        key: _quantityKey,
                        builder: (BuildContext context, void Function(void Function()) _) {
                          return Text(_quantity.toString(), style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500));
                        },
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          _quantityKey.currentState!.setState(() => _quantity += 1);
                        },
                        icon: const Icon(FontAwesome.plus_solid, size: 15, color: white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, thickness: 1, color: grey),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesome.cart_shopping_solid, size: 15, color: white),
                    SizedBox(width: 10),
                    Text("Order", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
