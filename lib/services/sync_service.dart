import 'package:flutter/material.dart';

class SyncService extends ChangeNotifier {
  bool _isSyncing = false;
  DateTime? _lastSyncTime;

  bool get isSyncing => _isSyncing;
  DateTime? get lastSyncTime => _lastSyncTime;

  Future<void> syncData() async {
    _isSyncing = true;
    notifyListeners();

    // Mock network sync
    await Future.delayed(const Duration(seconds: 3));

    _lastSyncTime = DateTime.now();
    _isSyncing = false;
    notifyListeners();
  }
}
