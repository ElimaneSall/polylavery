// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:polylavery/utils/colors.dart';
// import 'package:polylavery/widget/indicator.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Color> gradientColors = [
//     AppColor.contentColorCyan,
//     AppColor.contentColorBlue,
//   ];
//   int touchedIndex = -1;
//   bool showAvg = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColor.contentColorBlue,
//           title: Text("Tableau de bord"),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: <Widget>[
//             AspectRatio(
//               aspectRatio: 1.70,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   right: 18,
//                   left: 12,
//                   top: 24,
//                   bottom: 12,
//                 ),
//                 child: LineChart(
//                   showAvg ? avgData() : mainData(),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 60,
//               height: 34,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     showAvg = !showAvg;
//                   });
//                 },
//                 child: Text(
//                   'avg',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color:
//                         showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             AspectRatio(
//               aspectRatio: 1.3,
//               child: Row(
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Expanded(
//                     child: AspectRatio(
//                       aspectRatio: 1,
//                       child: PieChart(
//                         PieChartData(
//                           pieTouchData: PieTouchData(
//                             touchCallback:
//                                 (FlTouchEvent event, pieTouchResponse) {
//                               setState(() {
//                                 if (!event.isInterestedForInteractions ||
//                                     pieTouchResponse == null ||
//                                     pieTouchResponse.touchedSection == null) {
//                                   touchedIndex = -1;
//                                   return;
//                                 }
//                                 touchedIndex = pieTouchResponse
//                                     .touchedSection!.touchedSectionIndex;
//                               });
//                             },
//                           ),
//                           borderData: FlBorderData(
//                             show: false,
//                           ),
//                           sectionsSpace: 0,
//                           centerSpaceRadius: 40,
//                           sections: showingSections(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Indicator(
//                         color: AppColor.contentColorBlue,
//                         text: 'First',
//                         isSquare: true,
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Indicator(
//                         color: AppColor.contentColorYellow,
//                         text: 'Second',
//                         isSquare: true,
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Indicator(
//                         color: AppColor.contentColorPurple,
//                         text: 'Third',
//                         isSquare: true,
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Indicator(
//                         color: AppColor.contentColorGreen,
//                         text: 'Fourth',
//                         isSquare: true,
//                       ),
//                       SizedBox(
//                         height: 18,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 28,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text = const Text('MAR', style: style);
//         break;
//       case 5:
//         text = const Text('JUN', style: style);
//         break;
//       case 8:
//         text = const Text('SEP', style: style);
//         break;
//       default:
//         text = const Text('', style: style);
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: text,
//     );
//   }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '10K';
//         break;
//       case 3:
//         text = '30k';
//         break;
//       case 5:
//         text = '50k';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.left);
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         horizontalInterval: 1,
//         verticalInterval: 1,
//         getDrawingHorizontalLine: (value) {
//           return const FlLine(
//             color: AppColor.mainGridLineColor,
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return const FlLine(
//             color: AppColor.mainGridLineColor,
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             interval: 1,
//             getTitlesWidget: bottomTitleWidgets,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             interval: 1,
//             getTitlesWidget: leftTitleWidgets,
//             reservedSize: 42,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 3),
//             FlSpot(2.6, 2),
//             FlSpot(4.9, 5),
//             FlSpot(6.8, 3.1),
//             FlSpot(8, 4),
//             FlSpot(9.5, 3),
//             FlSpot(11, 4),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: gradientColors,
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: gradientColors
//                   .map((color) => color.withOpacity(0.3))
//                   .toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData avgData() {
//     return LineChartData(
//       lineTouchData: const LineTouchData(enabled: false),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         verticalInterval: 1,
//         horizontalInterval: 1,
//         getDrawingVerticalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingHorizontalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             getTitlesWidget: bottomTitleWidgets,
//             interval: 1,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: leftTitleWidgets,
//             reservedSize: 42,
//             interval: 1,
//           ),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 3.44),
//             FlSpot(2.6, 3.44),
//             FlSpot(4.9, 3.44),
//             FlSpot(6.8, 3.44),
//             FlSpot(8, 3.44),
//             FlSpot(9.5, 3.44),
//             FlSpot(11, 3.44),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: [
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!,
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!,
//             ],
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: [
//                 ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                     .lerp(0.2)!
//                     .withOpacity(0.1),
//                 ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                     .lerp(0.2)!
//                     .withOpacity(0.1),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(4, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 25.0 : 16.0;
//       final radius = isTouched ? 60.0 : 50.0;
//       const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: AppColor.contentColorBlue,
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: AppColor.mainTextColor1,
//               shadows: shadows,
//             ),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: AppColor.contentColorYellow,
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: AppColor.mainTextColor1,
//               shadows: shadows,
//             ),
//           );
//         case 2:
//           return PieChartSectionData(
//             color: AppColor.contentColorPurple,
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: AppColor.mainTextColor1,
//               shadows: shadows,
//             ),
//           );
//         case 3:
//           return PieChartSectionData(
//             color: AppColor.contentColorGreen,
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: AppColor.mainTextColor1,
//               shadows: shadows,
//             ),
//           );
//         default:
//           throw Error();
//       }
//     });
//   }
// }
