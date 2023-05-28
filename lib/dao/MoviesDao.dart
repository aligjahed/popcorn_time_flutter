import 'package:floor/floor.dart';

import '../models/Movie.dart';

@dao
abstract class MoviesDao{
  @Query('SELECT * FROM Movies')
  Future<List<Movie>?> getAllMovies();

  @insert
  Future<void> addMovie(Movie movie);

  @update
  Future<void> updateMovie(Movie movie);

  @delete
  Future<void> deleteMovie(Movie movie);

}