import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/booking_service.dart';
import '../services/auth_service.dart';
import '../models/event_model.dart';
import 'event_detail_screen.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingService = context.watch<BookingService>();
    final auth = context.watch<AuthService>();

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookingService.events.length,
        itemBuilder: (context, index) {
          final event = bookingService.events[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(event.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${event.location} • \$${event.price}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailScreen(event: event),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: auth.isAdmin
          ? FloatingActionButton(
              onPressed: () {
                // Admin feature: Add mock event
                bookingService.addEvent(EventModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: 'Admin Created Event',
                  description: 'This event was created by an admin.',
                  date: DateTime.now().add(const Duration(days: 20)),
                  location: 'Remote',
                  price: 0.0,
                ));
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
