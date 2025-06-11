part of '../home_passport_page.dart';

class ImpactScoreChart extends StatelessWidget {
  const ImpactScoreChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      borderOnForeground: true,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                Text(
                  '${Random().nextInt(1000)}',
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    spacing: 2,
                    children: [
                      Icon(FontAwesomeIcons.arrowUp, size: 14),
                      Text(
                        '+${Random().nextInt(100)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: AspectRatio(
                aspectRatio: 5,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final barsSpace = 4.0 * constraints.maxWidth / 400;
                    final barsWidth = 8.0 * constraints.maxWidth / 200;

                    return BarChart(
                      BarChartData(
                        barTouchData: const BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        groupsSpace: barsSpace,
                        barGroups: getData(barsWidth, barsSpace),
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              'Impact Score',
              style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
              textAlign: TextAlign.center,
            ),
            Text(
              'Top 5% in Jakarta',
              style: TextStyle(fontSize: 14, color: Color(0xFF1F2937)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
          BarChartRodData(
            toY: Random().nextInt(100).toDouble(),
            borderRadius: BorderRadius.circular(2),
            width: barsWidth,
            color: Color(0xFF374151),
          ),
        ],
      ),
    ];
  }
}
