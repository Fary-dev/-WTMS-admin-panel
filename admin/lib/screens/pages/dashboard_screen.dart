import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Benachrichtigungen anzeigen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sales Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Hier wird das Balkendiagramm hinzugefügt
              _buildBarChart(),
            ],
          ),
        ),
      ),
    );
  }

  // Funktion, die das Balkendiagramm erstellt
  Widget _buildBarChart() {
    return SizedBox(
      height: 300, // Beispielhöhe
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            // Erste Balkengruppe
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                toY: 15,
                color: Colors.blue,
                width: 25,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 2),
                rodStackItems: [
                  BarChartRodStackItem(0, 5, Colors.red),
                  BarChartRodStackItem(5, 10, Colors.green),
                  BarChartRodStackItem(10, 15, Colors.blue),
                ],
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: Colors.grey.withOpacity(0.2),
                  toY: 20,
                ),
              ),
            ]),
            // Weitere Balkengruppen hier...
          ],
        ),
      ),
    );
  }
}
