import 'dart:io';

import 'package:popcorn_time_flutter/db/database.dart';
import 'package:popcorn_time_flutter/models/Episode.dart';
import 'package:popcorn_time_flutter/models/Movie.dart';
import 'package:popcorn_time_flutter/models/Series.dart';
import 'package:uuid/uuid.dart';

Future<void> getMoviesAndSeries(String dirPath, AppDatabase db) async {
  const uuid = Uuid();

  // Getting video files in the provided directory
  final directory = Directory(dirPath);
  final dirEntities = await directory.listSync(recursive: true);
  final files = dirEntities.whereType<File>();
  final videos = files.where((element) =>
      element.path.endsWith('.mp4') || element.path.endsWith('.mkv'));

  // RegEx for separating movies and series and identifying patterns
  var seriesIdentifier = RegExp(r"S\d+E\d+|S\d|E\d+", caseSensitive: false);
  var qualityIdentifier = RegExp(r"\b\d{1,4}p\b");
  var yearIdentifier = RegExp(r"^[12][0-9]{3}$");

  for (var media in videos) {
    final mediaPathSplit = media.path.split('\\');
    final fileName = mediaPathSplit.last;
    var folderPath = mediaPathSplit[mediaPathSplit.length - 1];
    final year = yearIdentifier.firstMatch(fileName)?.group(0);
    final quality = qualityIdentifier.firstMatch(fileName)?.group(0);

    if (seriesIdentifier.hasMatch(fileName)) {
      // Get the index of season\Episode pattern and extract name from behind it
      var idIndex = seriesIdentifier.firstMatch(fileName)?.start;
      var name = fileName.substring(0, idIndex! - 1);

      // Replace any separator used in the name
      name = name.replaceAll(RegExp(r"[-_.]"), " ");

      var seriesDoesExist = await db.seriesDao.getSeriesByName(name);

      if (seriesDoesExist == Null) {
        var episodeId = uuid.v4();
        var episode = Episode(Id: episodeId, Path: media.path);
        db.episodeDao.addEpisode(episode);

        var newSeries = Series(
            EpisodesID: "$episodeId,",
            Id: uuid.v4(),
            Name: name,
            Path: folderPath,
            Year: year);

        db.seriesDao.addSeries(newSeries);
      } else {
        var episodeId = uuid.v4();
        var episode = Episode(Id: episodeId, Path: media.path);
        db.episodeDao.addEpisode(episode);

        var series = await db.seriesDao.getSeriesByName(name);

        series!.EpisodesID = "${series.EpisodesID}$episodeId";

        db.seriesDao.updateSeries(series);
      }
    } else {
      if (yearIdentifier.hasMatch(fileName)) {
        // Get the index of year pattern and extract name from behind it
        var yearIndex = yearIdentifier.firstMatch(fileName)?.start;
        var name = fileName.substring(0, yearIndex! - 1);
        name = name.replaceAll(RegExp(r"[-_.]"), " ");

        var movieDoesExist = await db.movieDao.getMovieByName(name);

        if (movieDoesExist == null) {
          final newMovie =
              Movie(Id: uuid.v4(), Name: name, Path: media.path, Year: year);

          db.movieDao.addMovie(newMovie);
        }
      }
    }
  }
}
