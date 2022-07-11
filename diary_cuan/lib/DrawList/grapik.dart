import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:pie_chart/pie_chart.dart';

class Graphic extends StatelessWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pie Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

enum LegendShape { circle, rectangle }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final dataMap = <String, double>{
    "Flutter": 7,
    "React": 2,
    "Xamarin": 10,
    "Ionic": 4,
  };

  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    "Xamarin": "Xamarin legend",
    "Ionic": "Ionic legend",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
    const Color(0xff94B49F),
    const Color(0xffECB390),
    const Color(0xffF37878),
    const Color(0xff4C3A51),
    const Color(0xffCE9461),
  ];

  ChartType? _chartType = ChartType.ring;
  double? _ringStrokeWidth = 32;
  bool _showLegendsInRow = true;
  bool _showLegends = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = true;
  bool _showChartValuesOutside = true;

  LegendShape? _legendShape = LegendShape.circle;
  LegendPosition? _legendPosition = LegendPosition.bottom;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
    final settings = SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Pie Chart Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ListTile(
              title: const Text("Chart Type"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<ChartType>(
                  value: _chartType,
                  items: const [
                    DropdownMenuItem(
                      value: ChartType.disc,
                      child: Text("disc"),
                    ),
                    DropdownMenuItem(
                      value: ChartType.ring,
                      child: Text("ring"),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _chartType = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Ring Width"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<double>(
                  value: _ringStrokeWidth,
                  disabledHint: const Text("select chartType.ring"),
                  items: const [
                    DropdownMenuItem(
                      value: 16,
                      child: Text("16"),
                    ),
                    DropdownMenuItem(
                      value: 32,
                      child: Text("32"),
                    ),
                    DropdownMenuItem(
                      value: 48,
                      child: Text("48"),
                    ),
                  ],
                  onChanged: (_chartType == ChartType.ring)
                      ? (val) {
                          setState(() {
                            _ringStrokeWidth = val;
                          });
                        }
                      : null,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Legend Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              value: _showLegends,
              title: const Text("Show Text"),
              onChanged: (val) {
                setState(() {
                  _showLegends = val;
                });
              },
            ),
            SwitchListTile(
              value: _showLegendsInRow,
              title: const Text("showLegendsInRow"),
              onChanged: (val) {
                setState(() {
                  _showLegendsInRow = val;
                });
              },
            ),
            ListTile(
              title: const Text("legendShape"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<LegendShape>(
                  value: _legendShape,
                  items: const [
                    DropdownMenuItem(
                      value: LegendShape.circle,
                      child: Text("BoxShape.circle"),
                    ),
                    DropdownMenuItem(
                      value: LegendShape.rectangle,
                      child: Text("BoxShape.rectangle"),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _legendShape = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("legendPosition"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<LegendPosition>(
                  value: _legendPosition,
                  items: const [
                    DropdownMenuItem(
                      value: LegendPosition.top,
                      child: Text("top"),
                    ),
                    DropdownMenuItem(
                      value: LegendPosition.bottom,
                      child: Text("bottom"),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _legendPosition = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Chart values Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              value: _showChartValues,
              title: const Text("showChartValues"),
              onChanged: (val) {
                setState(() {
                  _showChartValues = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValuesInPercentage,
              title: const Text("showChartValuesInPercentage"),
              onChanged: (val) {
                setState(() {
                  _showChartValuesInPercentage = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValuesOutside,
              title: const Text("showChartValuesOutside"),
              onChanged: (val) {
                setState(() {
                  _showChartValuesOutside = val;
                });
              },
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart"),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: chart,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: settings,
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    child: chart,
                  ),
                  settings,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  var dataMap;
  var colorList;
  return Scaffold(
    appBar: AppBar(
      title: const Text("Pie Chart 1"),
    ),
    body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: Colors.grey[50]!.withOpacity(0.15),
        colorList: colorList,
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
        ),
        totalValue: 100,
      ),
    ),
  );
}
