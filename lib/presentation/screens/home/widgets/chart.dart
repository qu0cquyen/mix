import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    List<SalesData> data = [
      SalesData(
          (currentDate.subtract(const Duration(days: 3)).day).toString(), 100),
      SalesData(
          (currentDate.subtract(const Duration(days: 2)).day).toString(), 35),
      SalesData(
          (currentDate.subtract(const Duration(days: 1)).day).toString(), 28),
      SalesData(currentDate.day.toString(), 34),
      SalesData((currentDate.add(const Duration(days: 1)).day).toString(), 32),
      SalesData((currentDate.add(const Duration(days: 2)).day).toString(), 40),
      SalesData((currentDate.add(const Duration(days: 3)).day).toString(), 80),
    ];

    return DecoratedBox(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: AppCorners.lgRadius,
            topRight: AppCorners.lgRadius,
          )),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppInsets.md, bottom: AppInsets.md, left: AppInsets.md),
            child: Row(
              children: [
                Text(
                  'Customer Stats',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: MediaQuery.of(context).devicePixelRatio / 1.65,
            child: BarChart(
              BarChartData(
                maxY: 100,
                groupsSpace: 12,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(data[value.toInt()].year);
                      },
                    ),
                  ),
                ),
                barGroups: data
                    .map(
                      (e) => BarChartGroupData(
                        x: data.indexOf(e),
                        barRods: [
                          BarChartRodData(
                            toY: e.sales,
                            borderRadius: BorderRadius.zero,
                            width: 22.0,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppInsets.sm, bottom: AppInsets.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95.0,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: AppCorners.lgBorder,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppInsets.sm,
                      horizontal: AppInsets.lg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          '148',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30.0),
                Container(
                  width: 95.0,
                  decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    borderRadius: AppCorners.lgBorder,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppInsets.sm,
                      horizontal: AppInsets.lg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          '60',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
