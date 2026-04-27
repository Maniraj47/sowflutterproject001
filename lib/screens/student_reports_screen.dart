import 'package:flutter/material.dart';

class StudentReportsScreen extends StatelessWidget {
  const StudentReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGradeOverview(context),
          const SizedBox(height: 24),
          Text(
            'Performance Analysis',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          _buildPerformanceChartPlaceholder(context),
          const SizedBox(height: 24),
          Text(
            'Recent Grades',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          _buildGradeItem('Math Quiz 4', '18/20', 'A'),
          _buildGradeItem('Physics Midterm', '85/100', 'B+'),
          _buildGradeItem('CS Assignment 2', '45/50', 'A'),
        ],
      ),
    );
  }

  Widget _buildGradeOverview(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current GPA',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Text(
                  '3.85',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Top 5%',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceChartPlaceholder(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar(40, Colors.blue),
                _buildBar(70, Colors.blue),
                _buildBar(55, Colors.blue),
                _buildBar(90, Colors.blue),
                _buildBar(65, Colors.blue),
                _buildBar(80, Colors.blue),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Attendance vs. Grades Correlation'),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(double height, Color color) {
    return Container(
      width: 30,
      height: height,
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      ),
    );
  }

  Widget _buildGradeItem(String title, String score, String grade) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Score: $score'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            grade,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
