import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
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

  bool _selectByProducts = false;

  final List<String> _sorts = <String>["Sort ↑", "Sort ↓"];

  String _sortType = "Sort ↑";

  final DropdownController _dropdownController = DropdownController();

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
                                        padding: const EdgeInsets.all(8),
                                        margin: EdgeInsets.only(right: _types.lastOrNull == _selectedType ? 0 : 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: _selectedType == type ? grey.withOpacity(.1) : transparent,
                                          border: _selectedType == type ? Border.all(color: white) : null,
                                        ),
                                        child: Text(type, style: const TextStyle(color: white, fontSize: 16)),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: .5, height: .5, color: grey),
                        const SizedBox(height: 10),
                        const Text("View", style: TextStyle(color: white, fontSize: 16)),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) _) {
                                return Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: AnimatedContainer(
                                        duration: 500.ms,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: _selectByProducts ? grey.withOpacity(.1) : transparent,
                                          border: Border.all(color: white, width: .3),
                                        ),
                                        child: const Text("Group by products", style: TextStyle(color: white, fontSize: 16)),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    if (_selectByProducts) const Icon(FontAwesome.x_solid, size: 10, color: white),
                                  ],
                                );
                              },
                            ),
                            const Spacer(),
                            StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) _) {
                                return CoolDropdown<String>(
                                  defaultItem: CoolDropdownItem(label: _sorts.first, value: _sorts.first),
                                  dropdownList: _sorts.map((String month) => CoolDropdownItem(label: month, value: month)).toList(),
                                  controller: _dropdownController,
                                  onChange: (String sortType) => _(() => _sortType = sortType),
                                  resultOptions: ResultOptions(
                                    textStyle: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
                                    boxDecoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(5), border: Border.all(color: white, width: .5)),
                                    openBoxDecoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(5), border: Border.all(color: white, width: .5)),
                                    height: 30,
                                    width: 100,
                                  ),
                                  dropdownOptions: DropdownOptions(
                                    width: 250,
                                    height: 220,
                                    top: 0,
                                    left: 0,
                                    color: grey.withOpacity(.3),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none,
                                    shadows: const <BoxShadow>[],
                                    animationType: DropdownAnimationType.scale,
                                    align: DropdownAlign.center,
                                    selectedItemAlign: SelectedItemAlign.center,
                                    gap: DropdownGap.zero,
                                    padding: EdgeInsets.zero,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  ),
                                  dropdownItemOptions: DropdownItemOptions(
                                    textStyle: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
                                    boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: transparent),
                                    selectedBoxDecoration: BoxDecoration(color: pink.withOpacity(.2)),
                                    selectedTextStyle: const TextStyle(color: pink, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                );
                              },
                            ),
                          ],
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
