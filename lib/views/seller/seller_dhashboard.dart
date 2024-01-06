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
    <String, dynamic>{"title": "Total Sale", "subtitle": "1234K DT", "chart_color": Colors.green, "data": <double>[], "percentage": "+167%"},
    <String, dynamic>{"title": "Total Profit", "subtitle": "564 DT", "chart_color": Colors.yellow, "data": <double>[], "percentage": "-156%"},
    <String, dynamic>{"title": "Total Orders", "subtitle": "52", "chart_color": Colors.purple, "data": <double>[], "percentage": "+22%"},
    <String, dynamic>{"title": "Likes", "subtitle": "153", "chart_color": Colors.blue, "data": <double>[], "percentage": "-2%"},
  ];
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
                                const SizedBox(width: 5),
                                Icon(item["percentage"].startsWith("-") ? FontAwesome.arrow_down_solid : FontAwesome.arrow_up_solid, size: 5, color: item["percentage"].startsWith("-") ? Colors.red : Colors.green),
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
                              height: 40,
                              width: 200,
                              child: LineChart(
                                LineChartData(
                                  gridData: const FlGridData(show: false),
                                  titlesData: const FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  minX: 0,
                                  maxX: 11,
                                  minY: 0,
                                  maxY: 6,
                                  lineBarsData: <LineChartBarData>[
                                    LineChartBarData(
                                      spots: const <FlSpot>[
                                        FlSpot(0, 3),
                                        FlSpot(2.6, 2),
                                        FlSpot(4.9, 5),
                                        FlSpot(6.8, 3.1),
                                        FlSpot(8, 4),
                                        FlSpot(9.5, 3),
                                        FlSpot(11, 4),
                                      ],
                                      isCurved: true,
                                      gradient: LinearGradient(colors: <Color>[item["chart_color"].withOpacity(.6), white.withOpacity(.4)]),
                                      barWidth: 5,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: true),
                                      belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: <Color>[item["chart_color"].withOpacity(.6), white.withOpacity(.4)])),
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
          ],
        ),
      ),
    );
  }
}
