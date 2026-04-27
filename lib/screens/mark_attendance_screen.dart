import 'package:flutter/material.dart';

class MarkAttendanceScreen extends StatefulWidget {
  const MarkAttendanceScreen({super.key});

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  bool _isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (!_isScanning)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.qr_code_scanner, size: 100, color: Colors.white54),
                      const SizedBox(height: 16),
                      Text(
                        'Align QR Code within the frame',
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                    ],
                  ),
                // Scan frame
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mark Your Attendance',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Scan the QR code displayed by your instructor to mark your presence for the current session.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() => _isScanning = !_isScanning);
                      if (_isScanning) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Scanning...')),
                        );
                      }
                    },
                    icon: Icon(_isScanning ? Icons.stop : Icons.qr_code_scanner),
                    label: Text(_isScanning ? 'Stop Scanning' : 'Start Scanning'),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Having trouble? Enter code manually'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
