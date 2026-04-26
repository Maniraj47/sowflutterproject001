import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event_model.dart';
import '../services/booking_service.dart';
import '../services/auth_service.dart';
import '../services/notification_service.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image, size: 100, color: Colors.indigo),
            ),
            const SizedBox(height: 24),
            Text(
              event.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(event.location, style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                Text(
                  '\$${event.price}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(event.description),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  final userId = context.read<AuthService>().currentUser!.id;
                  final success = await context.read<BookingService>().bookEvent(event.id, userId);
                  
                  if (success && context.mounted) {
                    context.read<NotificationService>().addNotification(
                      'Booking Confirmed!',
                      'You have successfully booked ${event.title}.',
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Booking Successful!')),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                child: const Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
