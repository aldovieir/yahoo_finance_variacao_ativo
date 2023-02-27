import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/graphic_ativo_controller.dart';

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            this == Orientation.landscape ||
                    MediaQuery.of(context).size.height < 750
                ? const Expanded(child: GraphicAtivoView())
                : const AspectRatio(aspectRatio: 1, child: GraphicAtivoView()),
            const SizedBox(height: 28),
            if (this == Orientation.portrait) ...[
              const Text("asdsa"),
              const SizedBox(height: 16),
            ]
          ],
        ),
      );
    });
  }
}

class GraphicAtivoView extends GetView<GraphicAtivoController> {
  const GraphicAtivoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getAtivo();
    return Scaffold(
        appBar: AppBar(
          title: const Text('GraphicAtivoView'),
          centerTitle: true,
        ),
        body: graphic(context, controller));
  }
}

Widget graphic(BuildContext context, GraphicAtivoController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
    child: LayoutBuilder(builder: (context, constraints) {
      return LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            horizontalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                strokeWidth: 1,
                dashArray: [8, 8],
              );
            },
          ),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: controller.ativoDays.value
                  .map(
                    (day) => FlSpot(
                      day.day.microsecondsSinceEpoch.toDouble(),
                      day.openPrice,
                    ),
                  )
                  .toList(),
              barWidth: 1.0,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) => [
                LineTooltipItem(
                  touchedSpots.first.y.toStringAsFixed(2),
                  const TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
