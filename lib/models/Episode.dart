import 'package:floor/floor.dart';

@entity
class Episode {
  @primaryKey
  final String Id;
  final String? Quality;
  final String Path;

  Episode({required this.Id, this.Quality, required this.Path});
}
