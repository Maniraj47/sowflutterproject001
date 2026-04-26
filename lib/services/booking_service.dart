import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../models/booking_model.dart';

class BookingService extends ChangeNotifier {
  final List<EventModel> _events = [
    EventModel(
      id: '1',
      title: 'Tech Conference 2024',
      description: 'The biggest tech event of the year.',
      date: DateTime.now().add(const Duration(days: 10)),
      location: 'San Francisco, CA',
      price: 299.0,
    ),
    EventModel(
      id: '2',
      title: 'Music Festival',
      description: 'Enjoy live performances from top artists.',
      date: DateTime.now().add(const Duration(days: 15)),
      location: 'Austin, TX',
      price: 150.0,
    ),
    EventModel(
      id: '3',
      title: 'Startup Pitch Day',
      description: 'Watch entrepreneurs pitch their ideas.',
      date: DateTime.now().add(const Duration(days: 5)),
      location: 'New York, NY',
      price: 50.0,
    ),
  ];

  final List<BookingModel> _bookings = [];

  List<EventModel> get events => _events;
  List<BookingModel> get bookings => _bookings;

  List<BookingModel> getBookingsForUser(String userId) {
    return _bookings.where((b) => b.userId == userId).toList();
  }

  Future<bool> bookEvent(String eventId, String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final booking = BookingModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      eventId: eventId,
      userId: userId,
      bookingDate: DateTime.now(),
    );

    _bookings.add(booking);
    notifyListeners();
    return true;
  }

  void addEvent(EventModel event) {
    _events.add(event);
    notifyListeners();
  }
}
