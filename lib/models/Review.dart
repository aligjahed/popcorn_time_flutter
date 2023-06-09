import 'package:floor/floor.dart';

@entity
class Review {
  @primaryKey
  final String Id;

  final String ReviewText;
  final int Rating;

  Review(this.Id, this.ReviewText, this.Rating);
}