import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../services/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<NotificationService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () => service.markAllAsRead(),
            child: const Text('Mark all read'),
          ),
        ],
      ),
      body: service.notifications.isEmpty
          ? const Center(child: Text('No notifications'))
          : ListView.builder(
              itemCount: service.notifications.length,
              itemBuilder: (context, index) {
                final notification = service.notifications[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: notification.isRead ? Colors.grey : Colors.indigo,
                    child: const Icon(Icons.notifications, color: Colors.white),
                  ),
                  title: Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(notification.message),
                  trailing: Text(
                    DateFormat('HH:mm').format(notification.timestamp),
                    style: const TextStyle(fontSize: 12),
                  ),
                  onTap: () => service.markAsRead(notification.id),
                );
              },
            ),
    );
  }
}
