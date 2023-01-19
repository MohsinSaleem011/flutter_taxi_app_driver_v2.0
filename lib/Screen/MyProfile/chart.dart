import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWallet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      Color(0xFFfbbf14),
      Color(0xFFea443a),
//      Color(0xFF009688),
//      Color(0xFF215B8E),
    ];
    return AspectRatio(
      aspectRatio: 1.80,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            //color: Color(0xff232d37)
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 10, bottom: 10),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20,
                    getTitlesWidget: (value, meta) {
                      switch(value.toInt()) {
                        case 2: return const Text('MAR');
                        case 5: return const Text('JUN');
                        case 8: return const Text('SEP');
                      }
                      return Text('');
                    },
                  )
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch(value.toInt()) {
                        case 1: return const Text('10k');
                        case 3: return  const Text('30k');
                        case 5: return  const Text('50k');
                      }
                      return Text('');
                    },
                    reservedSize: 28,
                  )
                ),
              ),
              borderData: FlBorderData(
                  show: false,
                  border: Border.all(color: Color(0xff37434d), width: 1)
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(2, 2),
                    FlSpot(4, 0.5),
                    FlSpot(6, 3.1),
                    FlSpot(8, 2),
                    FlSpot(11, 3.5),
                  ],
                  isCurved: true,
                  barWidth: 5,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  // belowBarData: BarAreaData(
                  //   show: true,
                  //   colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
