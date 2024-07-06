import '../model/location.dart';
import '../model/review.dart';

class HeroTag {
  static String image(String imageUrl) => imageUrl;

  static String addressLine1(Location location) =>
      location.name + location.addressLine1;

  static String addressLine2(Location location) =>
      location.name + location.description;

  static String stars(Location location) =>
      location.name + location.starRating.toString();

  static String avatar(Review review, int position) =>
      review.imageUrl + position.toString();
}
