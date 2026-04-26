class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final double price;
  final String imageUrl;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.price,
    this.imageUrl = 'https://via.placeholder.com/150',
  });
}
