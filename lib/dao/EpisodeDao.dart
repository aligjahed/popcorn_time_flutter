import 'package:floor/floor.dart';

import '../models/Episode.dart';

@dao
abstract class EpisodeDao{
  @Query("SELECT * FROM Episode WHERE Id = :id")
  Future<Episode?> getEpisodeWithId(int id);

  @insert
  Future<void> addEpisode(Episode episode);

  @update
  Future<void> updateEpisode(Episode episode);

  @delete
  Future<void> deleteEpisode(Episode episode);
}