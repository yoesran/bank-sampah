import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RiwayatTransaksiChart extends StatefulWidget {
  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  const RiwayatTransaksiChart({Key? key}) : super(key: key);

  @override
  RiwayatTransaksiChartState createState() => RiwayatTransaksiChartState();
}

class RiwayatTransaksiChartState extends State<RiwayatTransaksiChart> {
  final Color barBackgroundColor = const Color(0xff72d8bf);

  int touchedIndex = -1;

  String? weekDay;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.25,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text(
                  'Riwayat Transaksi',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 38,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BarChart(
                      mainBarData(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    String day = "",
    List<int> showTooltips = const [],
  }) {
    bool isDay = false;

    if (day == DateFormat('EEEE').format(DateTime.now())) {
      isDay = true;
    }
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: (isTouched || isDay) ? [Color(0xFF7EB044)] : [barColor],
          width: width,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 30, isTouched: i == touchedIndex, day: "Monday");
          case 1:
            return makeGroupData(1, 20, isTouched: i == touchedIndex, day: "Tuesday");
          case 2:
            return makeGroupData(2, 60, isTouched: i == touchedIndex, day: "Wednesday");
          case 3:
            return makeGroupData(3, 100, isTouched: i == touchedIndex, day: "Thursday");
          case 4:
            return makeGroupData(4, 40, isTouched: i == touchedIndex, day: "Friday");
          case 5:
            return makeGroupData(5, 70, isTouched: i == touchedIndex, day: "Saturday");
          case 6:
            return makeGroupData(6, 50, isTouched: i == touchedIndex, day: "Sunday");
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      maxY: 100,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Senin';
                  break;
                case 1:
                  weekDay = 'Selasa';
                  break;
                case 2:
                  weekDay = 'Rabu';
                  break;
                case 3:
                  weekDay = 'Kamis';
                  break;
                case 4:
                  weekDay = "Jum'at";
                  break;
                case 5:
                  weekDay = 'Sabtu';
                  break;
                case 6:
                  weekDay = 'Minggu';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay! + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Sen';
              case 1:
                return 'Sel';
              case 2:
                return 'Rab';
              case 3:
                return 'Kam';
              case 4:
                return 'Jum';
              case 5:
                return 'Sab';
              case 6:
                return 'Min';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 8,
          reservedSize: 30,
          interval: 20,
          getTitles: (value) {
            if (value == 0) {
              return '5';
            } else if (value == 20) {
              return '20';
            } else if (value == 40) {
              return '40';
            } else if (value == 60) {
              return '60';
            } else if (value == 80) {
              return '80';
            } else if (value == 100) {
              return '100';
            } else {
              return '';
            }
          },
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }
}
