import 'package:floor/floor.dart';

@entity
class Review {
  @primaryKey
  final int Id;

  final String ReviewText;
  final int Rating;

  Review(this.Id, this.ReviewText, this.Rating);
}