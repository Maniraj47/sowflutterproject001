import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../services/sync_service.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<SyncService>();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_sync, size: 100, color: Colors.indigo),
          const SizedBox(height: 24),
          const Text(
            'Data Synchronization',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Keep your events and bookings updated across all your devices.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 48),
          if (service.isSyncing)
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Syncing with server...'),
              ],
            )
          else
            Column(
              children: [
                Text(
                  service.lastSyncTime != null
                      ? 'Last synced: ${DateFormat('MMM dd, HH:mm').format(service.lastSyncTime!)}'
                      : 'Never synced',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () => service.syncData(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Sync Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
