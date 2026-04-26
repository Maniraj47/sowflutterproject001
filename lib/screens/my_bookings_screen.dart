import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../services/booking_service.dart';
import '../services/auth_service.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final bookingService = context.watch<BookingService>();
    
    // Show all bookings if admin, else only user's bookings
    final bookings = auth.isAdmin 
        ? bookingService.bookings 
        : bookingService.getBookingsForUser(auth.currentUser!.id);

    if (bookings.isEmpty) {
      return const Center(child: Text('No bookings found.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        final event = bookingService.events.firstWhere((e) => e.id == booking.eventId);
        
        return Card(
          child: ListTile(
            title: Text(event.title),
            subtitle: Text('Booked on: ${DateFormat('MMM dd, yyyy').format(booking.bookingDate)}'),
            trailing: Chip(
              label: Text(booking.status),
              backgroundColor: Colors.green.withValues(alpha: 0.1),
            ),
          ),
        );
      },
    );
  }
}
