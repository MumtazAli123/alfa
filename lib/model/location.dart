import 'review.dart';

class Location {
  final String name;
  final String imageUrl;
  final String latitude;
  final String longitude;
  final String addressLine1;
  final String description;
  final int starRating;
  final List<Review> reviews;

  Location({
    required this.name,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
    required this.description,
    required this.starRating,
    required this.reviews,
  });


}
