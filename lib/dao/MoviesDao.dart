import 'package:floor/floor.dart';

import '../models/Movie.dart';

@dao
abstract class MoviesDao{
  @Query('SELECT * FROM Movies')
  Future<List<Movie>?> getAllMovies();

  @Query('SELECT * FROM Movies WHERE Name = :name')
  Future<Movie?> getMovieByName(String name);

  @insert
  Future<void> addMovie(Movie movie);

  @update
  Future<void> updateMovie(Movie movie);

  @delete
  Future<void> deleteMovie(Movie movie);

}