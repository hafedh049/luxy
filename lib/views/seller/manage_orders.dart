import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({super.key});

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<String> _types = <String>["Padding", "Confirmed", "Ready to ship", "Shipped"];

  String _selectedType = "Padding";

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(FontAwesome.chevron_left_solid, size: 20, color: pink)),
        centerTitle: true,
        title: const Text("Seller Dashboard", style: TextStyle(color: white, fontSize: 16)),
        actions: <Widget>[IconButton(onPressed: () {}, icon: const Icon(FontAwesome.magnifying_glass_solid, size: 20, color: white))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: pink,
                    dividerColor: grey,
                    indicatorColor: pink,
                    onTap: (int value) => _tabController.animateTo(value, duration: 300.ms, curve: Curves.linear),
                    tabs: const <Tab>[Tab(text: 'Active'), Tab(text: 'Completed')],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return Row(
                              children: <Widget>[
                                for (final String type in _types)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _(() => _selectedType = type);
                                      },
                                      child: AnimatedContainer(
                                        duration: 500.ms,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: _selectedType == type ? grey.withOpacity(.1) : transparent,
                                          border: _selectedType == type ? Border.all(color: white) : null,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
