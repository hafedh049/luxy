import 'dart:math';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/seller/manage_orders.dart';

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
      "callback": (BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ManageOrders())),
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
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * index]),
      "percentage": "+167%",
    },
    <String, dynamic>{
      "title": "Total Profit",
      "subtitle": "564 DT",
      "chart_color": Colors.yellow,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * index]),
      "percentage": "-156%",
    },
    <String, dynamic>{
      "title": "Total Orders",
      "subtitle": "52",
      "chart_color": Colors.purple,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * index]),
      "percentage": "+22%",
    },
    <String, dynamic>{
      "title": "Likes",
      "subtitle": "153",
      "chart_color": Colors.blue,
      "data": List<List<double>>.generate(10, (int index) => <double>[index.toDouble(), Random().nextDouble() * index]),
      "percentage": "-2%",
    },
  ];
  final DropdownController _dropdownController = DropdownController();
  final DropdownController _chartController = DropdownController();

  final Map<String, int> _months = <String, int>{"Jan": 31, "Feb": 28, "Mar": 31, "Apr": 30, "May": 31, "Jun": 30, "Jul": 31, "Aug": 31, "Sep": 30, "Oct": 31, "Nov": 30, "Dec": 31};

  String _selectedMonth = "Jan";
  String _selectedChart = "Sales";

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
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(FontAwesome.l_solid, size: 20, color: pink)),
        centerTitle: true,
        title: const Text("Seller Dashboard", style: TextStyle(color: white, fontSize: 16)),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Badge(
              label: Text((Random().nextInt(9) + 1).toString(), style: const TextStyle(fontSize: 10, color: white)),
              backgroundColor: pink,
              smallSize: 15,
              padding: const EdgeInsets.all(1),
              child: const Icon(FontAwesome.bell_solid, size: 20, color: white),
            ),
          ),
          const SizedBox(width: 16),
        ],
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
                            Badge(
                              label: Text((Random().nextInt(9) + 1).toString(), style: const TextStyle(fontSize: 10, color: white)),
                              backgroundColor: pink,
                              smallSize: 15,
                              padding: const EdgeInsets.all(1),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: white),
                                child: Icon(item["icon"], size: 20, color: dark),
                              ),
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
                                  clipData: const FlClipData.all(),
                                  gridData: const FlGridData(show: false),
                                  titlesData: const FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: <LineChartBarData>[
                                    LineChartBarData(
                                      spots: item["data"].map((List<double> e) => FlSpot(e[0], e[1])).toList().cast<FlSpot>(),
                                      isCurved: true,
                                      color: item["chart_color"],
                                      barWidth: 1,
                                      isStrokeCapRound: false,
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
            Expanded(
              child: StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("$_selectedMonth 1 - $_selectedMonth ${_months[_selectedMonth]}", style: TextStyle(color: white.withOpacity(.6), fontSize: 12, fontWeight: FontWeight.w500)),
                          const Spacer(),
                          CoolDropdown<String>(
                            defaultItem: CoolDropdownItem(label: _selectedMonth, value: _selectedMonth),
                            dropdownList: _months.keys.map((String month) => CoolDropdownItem(label: month, value: month)).toList(),
                            controller: _dropdownController,
                            onChange: (String month) => _(() => _selectedMonth = month),
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CoolDropdown<String>(
                                defaultItem: CoolDropdownItem(label: _selectedChart, value: _selectedChart),
                                dropdownList: const <String>["Sales", "Orders"].map((String chart) => CoolDropdownItem(label: chart, value: chart)).toList(),
                                controller: _chartController,
                                onChange: (String chart) => _(() => _selectedChart = chart),
                                resultOptions: ResultOptions(
                                  textStyle: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
                                  boxDecoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(5), border: Border.all(color: white, width: .5)),
                                  openBoxDecoration: BoxDecoration(color: grey.withOpacity(.3), borderRadius: BorderRadius.circular(5), border: Border.all(color: white, width: .5)),
                                  height: 30,
                                  width: 100,
                                ),
                                dropdownOptions: DropdownOptions(
                                  width: 100,
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
                              const SizedBox(height: 10),
                              Expanded(
                                child: LineChart(
                                  LineChartData(
                                    gridData: const FlGridData(show: true),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (double value, TitleMeta meta) => Text(value.toStringAsFixed(0), style: TextStyle(fontSize: 10, color: white.withOpacity(.8), fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (double value, TitleMeta meta) => Text(value == 0.0 || value > 25.0 ? "" : "${value.toStringAsFixed(0)} $_selectedMonth", style: TextStyle(fontSize: 10, color: white.withOpacity(.8), fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    ),
                                    clipData: const FlClipData.all(),
                                    borderData: FlBorderData(show: false),
                                    minY: 0,
                                    lineBarsData: <LineChartBarData>[
                                      LineChartBarData(
                                        spots: List<List<double>>.generate(_months[_selectedMonth]!, (int index) => <double>[index.toDouble(), Random().nextDouble() * index]).map((List<double> e) => FlSpot(e[0], e[1])).toList().cast<FlSpot>(),
                                        isCurved: true,
                                        color: pink,
                                        barWidth: 1,
                                        isStrokeCapRound: false,
                                        dotData: const FlDotData(show: false),
                                        belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: <Color>[pink.withOpacity(.8), white.withOpacity(.2)])),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text("Last Live Performance", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Divider(color: grey.withOpacity(.3), height: .4, thickness: .5),
          ],
        ),
      ),
    );
  }
}
