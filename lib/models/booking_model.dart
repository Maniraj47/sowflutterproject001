class BookingModel {
  final String id;
  final String eventId;
  final String userId;
  final DateTime bookingDate;
  final String status;

  BookingModel({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.bookingDate,
    this.status = 'Confirmed',
  });
}
