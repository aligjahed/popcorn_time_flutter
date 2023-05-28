import 'package:floor/floor.dart';
import 'package:popcorn_time_flutter/models/Series.dart';

@dao
abstract class SeriesDao{
  @Query('SELECT * FROM Series')
  Future<List<Series>?> getAllSeries();

  @insert
  Future<void> addSeries(Series series);

  @update
  Future<void> updateSeries(Series series);

  @delete
  Future<void> deleteSeries(Series series);

}