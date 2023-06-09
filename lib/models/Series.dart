import 'package:floor/floor.dart';

@entity
class Series {
  @primaryKey
  final String Id;

  final String Name;
  final String Path;
  final String? Year;
  final String? Quality;

   String EpisodesID;
  final String? TagsID;
  final String? UserReviewID;

  Series(
      {required this.EpisodesID,
      required this.Id,
      required this.Name,
      required this.Path,
      required this.Year,
      this.Quality,
      this.TagsID,
      this.UserReviewID});
}
