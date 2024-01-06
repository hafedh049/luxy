import 'dart:math';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  final List<Map<String, dynamic>> _managments = <Map<String, dynamic>>[
    <String, dynamic>{
      "icon": FontAwesome.jedi_order_brand,
      "title": "Manage Orders",
      "subtitle": "24 Padding",
      "callback": (BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Container())),
    },
    <String, dynamic>{
      "icon": FontAwesome.cube_solid,
      "title": "Manage Products",
      "subtitle": "244 Active",
      "callback": (BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Container())),
    },
  ];
  final List<Map<String, dynamic>> _overview = <Map<String, dynamic>>[
    <String, dynamic>{
      "title": "Total Sale",
      "subtitle": "1234K DT",
      "chart_color": Colors.green,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * 20]),
      "percentage": "+167%",
    },
    <String, dynamic>{
      "title": "Total Profit",
      "subtitle": "564 DT",
      "chart_color": Colors.yellow,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * 20]),
      "percentage": "-156%",
    },
    <String, dynamic>{
      "title": "Total Orders",
      "subtitle": "52",
      "chart_color": Colors.purple,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * 20]),
      "percentage": "+22%",
    },
    <String, dynamic>{
      "title": "Likes",
      "subtitle": "153",
      "chart_color": Colors.blue,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * 20]),
      "percentage": "-2%",
    },
  ];
  final DropdownController _dropdownController = DropdownController();

  final List<Map<String, dynamic>> _months = <Map<String, dynamic>>[
    <String, dynamic>{
      "": "Jan",
    },
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String _selectedMonth = "Jan";

  @override
  void dispose() {
    _dropdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white)),
        title: const Text("Seller Dashboard", style: TextStyle(color: white, fontSize: 16)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                for (final Map<String, dynamic> item in _managments) ...<Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => item["callback"](context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: grey.withOpacity(.1)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: white),
                              child: Icon(item["icon"], size: 20, color: dark),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(item["title"], style: const TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 5),
                                  Text(item["subtitle"], style: TextStyle(color: white.withOpacity(.6), fontSize: 10, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ],
            ),
            const SizedBox(height: 10),
            const Text("Today Overview", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              runSpacing: 5,
              spacing: 5,
              children: <Widget>[
                for (final Map<String, dynamic> item in _overview)
                  Container(
                    width: (MediaQuery.sizeOf(context).width - 16 * 2) / 2 - 5,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: grey.withOpacity(.1)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(item["title"], style: const TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(item["percentage"], style: TextStyle(color: item["percentage"].startsWith("-") ? Colors.red : Colors.green, fontSize: 10, fontWeight: FontWeight.w500)),
                                const SizedBox(width: 2),
                                Icon(item["percentage"].startsWith("-") ? FontAwesome.arrow_down_solid : FontAwesome.arrow_up_solid, size: 8, color: item["percentage"].startsWith("-") ? Colors.red : Colors.green),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(item["subtitle"], style: TextStyle(color: white.withOpacity(.8), fontSize: 10, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            SizedBox(
                              height: 20,
                              width: 60,
                              child: LineChart(
                                LineChartData(
                                  gridData: const FlGridData(show: false),
                                  titlesData: const FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: <LineChartBarData>[
                                    LineChartBarData(
                                      spots: item["data"].map((List<double> e) => FlSpot(e[0], e[1])).toList().cast<FlSpot>(),
                                      isCurved: true,
                                      gradient: LinearGradient(colors: <Color>[item["chart_color"].withOpacity(.8), white.withOpacity(.2)]),
                                      barWidth: 1,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: <Color>[item["chart_color"].withOpacity(.8), white.withOpacity(.2)])),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Analytics", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Row(
                  children: <Widget>[
                    const Text("${_selectedMonth} 1 - ${_selectedMonth} ?", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    CoolDropdown<String>(
                      defaultItem: CoolDropdownItem(label: _selectedMonth, value: _selectedMonth),
                      dropdownList: _months.map((String month) => CoolDropdownItem(label: month, value: month)).toList(),
                      controller: _dropdownController,
                      onChange: (String month) {},
                      resultOptions: ResultOptions(
                        textStyle: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
                        boxDecoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(5), border: Border.all(color: white)),
                        openBoxDecoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(5), border: Border.all(color: white)),
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
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
