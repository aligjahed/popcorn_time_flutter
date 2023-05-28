// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:popcorn_time_flutter/dao/EpisodeDao.dart';
import 'package:popcorn_time_flutter/dao/MoviesDao.dart';
import 'package:popcorn_time_flutter/dao/ReviewsDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/SeriesDao.dart';
import '../dao/TagsDao.dart';
import '../models/Episode.dart';
import '../models/Movie.dart';
import '../models/Review.dart';
import '../models/Series.dart';
import '../models/Tag.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Series , Movie , Episode , Tag , Review])
abstract class AppDatabase extends FloorDatabase {
  MoviesDao get movieDao;
  SeriesDao get seriesDao;
  EpisodeDao get episodeDao;
  ReviewsDao get reviewDao;
  TagsDao get tagsDao;

}