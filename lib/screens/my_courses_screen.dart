import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildCourseCard(
          context,
          'Advanced Mathematics',
          'Prof. Sarah Miller',
          '88% Attendance',
          0.88,
          Colors.blue,
        ),
        _buildCourseCard(
          context,
          'Physics II',
          'Dr. Robert Brown',
          '92% Attendance',
          0.92,
          Colors.orange,
        ),
        _buildCourseCard(
          context,
          'Computer Science 101',
          'Prof. Alan Turing',
          '75% Attendance',
          0.75,
          Colors.green,
        ),
        _buildCourseCard(
          context,
          'Literature & Composition',
          'Dr. Maya Angelou',
          '100% Attendance',
          1.0,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildCourseCard(
    BuildContext context,
    String title,
    String instructor,
    String status,
    double progress,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.book, color: color),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        instructor,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attendance',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                Text(
                  status,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: color,
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Course Info'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('View Reports'),
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
