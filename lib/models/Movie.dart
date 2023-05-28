import 'package:floor/floor.dart';

@entity
class Movie {
  @primaryKey
  final int Id;

  final String Name;
  final String Path;
  final String Year;

  final String? TagsID;
  final String? UserReviewID;

  const Movie(
      {required this.Id,
      required this.Name,
      required this.Path,
      required this.Year,
      required this.TagsID,
      required this.UserReviewID});
}
