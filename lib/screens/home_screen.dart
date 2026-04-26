import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../services/notification_service.dart';
import 'event_list_screen.dart';
import 'my_bookings_screen.dart';
import 'notification_screen.dart';
import 'sync_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const EventListScreen(),
    const MyBookingsScreen(),
    const NotificationScreen(),
    const SyncScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final notificationService = context.watch<NotificationService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(auth.isAdmin ? 'Admin Dashboard' : 'Evently'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => auth.logout(),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Events'),
          const BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookings'),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(notificationService.unreadCount.toString()),
              isLabelVisible: notificationService.unreadCount > 0,
              child: const Icon(Icons.notifications),
            ),
            label: 'Alerts',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.sync), label: 'Sync'),
        ],
      ),
    );
  }
}
