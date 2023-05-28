import 'package:floor/floor.dart';

@entity
class Episode {
  @primaryKey
  final int Id;
  final String Path;

  Episode(this.Id, this.Path);
}