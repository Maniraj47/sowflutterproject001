import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationService extends ChangeNotifier {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      id: '1',
      title: 'Welcome to Evently!',
      message: 'Start exploring and booking amazing events.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ];

  List<NotificationModel> get notifications => _notifications;
  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void addNotification(String title, String message) {
    _notifications.insert(0, NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      message: message,
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index].isRead = true;
      notifyListeners();
    }
  }

  void markAllAsRead() {
    for (var n in _notifications) {
      n.isRead = true;
    }
    notifyListeners();
  }
}
