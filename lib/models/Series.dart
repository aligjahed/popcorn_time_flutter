import 'package:floor/floor.dart';

@entity
class Series {
  @primaryKey
  final int Id;

  final String Name;
  final String Path;
  final String Year;

  final String EpisodesID;
  final String? TagsID;
  final String? UserReviewID;

  const Series(this.EpisodesID, this.Id, this.Name, this.Path, this.Year,
      this.TagsID, this.UserReviewID);
}
