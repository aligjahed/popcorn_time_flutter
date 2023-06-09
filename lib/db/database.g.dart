// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MoviesDao? _movieDaoInstance;

  SeriesDao? _seriesDaoInstance;

  EpisodeDao? _episodeDaoInstance;

  ReviewsDao? _reviewDaoInstance;

  TagsDao? _tagsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Series` (`Id` TEXT NOT NULL, `Name` TEXT NOT NULL, `Path` TEXT NOT NULL, `Year` TEXT, `Quality` TEXT, `EpisodesID` TEXT NOT NULL, `TagsID` TEXT, `UserReviewID` TEXT, PRIMARY KEY (`Id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`Id` TEXT NOT NULL, `Name` TEXT NOT NULL, `Path` TEXT NOT NULL, `Year` TEXT, `TagsID` TEXT, `UserReviewID` TEXT, PRIMARY KEY (`Id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Episode` (`Id` TEXT NOT NULL, `Quality` TEXT, `Path` TEXT NOT NULL, PRIMARY KEY (`Id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tag` (`Id` TEXT NOT NULL, `Name` TEXT NOT NULL, `Color` TEXT NOT NULL, PRIMARY KEY (`Id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Review` (`Id` TEXT NOT NULL, `ReviewText` TEXT NOT NULL, `Rating` INTEGER NOT NULL, PRIMARY KEY (`Id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MoviesDao get movieDao {
    return _movieDaoInstance ??= _$MoviesDao(database, changeListener);
  }

  @override
  SeriesDao get seriesDao {
    return _seriesDaoInstance ??= _$SeriesDao(database, changeListener);
  }

  @override
  EpisodeDao get episodeDao {
    return _episodeDaoInstance ??= _$EpisodeDao(database, changeListener);
  }

  @override
  ReviewsDao get reviewDao {
    return _reviewDaoInstance ??= _$ReviewsDao(database, changeListener);
  }

  @override
  TagsDao get tagsDao {
    return _tagsDaoInstance ??= _$TagsDao(database, changeListener);
  }
}

class _$MoviesDao extends MoviesDao {
  _$MoviesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Path': item.Path,
                  'Year': item.Year,
                  'TagsID': item.TagsID,
                  'UserReviewID': item.UserReviewID
                }),
        _movieUpdateAdapter = UpdateAdapter(
            database,
            'Movie',
            ['Id'],
            (Movie item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Path': item.Path,
                  'Year': item.Year,
                  'TagsID': item.TagsID,
                  'UserReviewID': item.UserReviewID
                }),
        _movieDeletionAdapter = DeletionAdapter(
            database,
            'Movie',
            ['Id'],
            (Movie item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Path': item.Path,
                  'Year': item.Year,
                  'TagsID': item.TagsID,
                  'UserReviewID': item.UserReviewID
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  final UpdateAdapter<Movie> _movieUpdateAdapter;

  final DeletionAdapter<Movie> _movieDeletionAdapter;

  @override
  Future<List<Movie>?> getAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM Movies',
        mapper: (Map<String, Object?> row) => Movie(
            Id: row['Id'] as String,
            Name: row['Name'] as String,
            Path: row['Path'] as String,
            Year: row['Year'] as String?,
            TagsID: row['TagsID'] as String?,
            UserReviewID: row['UserReviewID'] as String?));
  }

  @override
  Future<Movie?> getMovieByName(String name) async {
    return _queryAdapter.query('SELECT * FROM Movies WHERE Name = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            Id: row['Id'] as String,
            Name: row['Name'] as String,
            Path: row['Path'] as String,
            Year: row['Year'] as String?,
            TagsID: row['TagsID'] as String?,
            UserReviewID: row['UserReviewID'] as String?),
        arguments: [name]);
  }

  @override
  Future<void> addMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMovie(Movie movie) async {
    await _movieUpdateAdapter.update(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMovie(Movie movie) async {
    await _movieDeletionAdapter.delete(movie);
  }
}

class _$SeriesDao extends SeriesDao {
  _$SeriesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _seriesInsertionAdapter = InsertionAdapter(
            database,
            'Series',
            (Series item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Path': item.Path,
                  'Year': item.Year,
                  'Quality': item.Quality,
                  'EpisodesID': item.EpisodesID,
                  'TagsID': item.TagsID,
                  'UserReviewID': item.UserReviewID
                }),
        _seriesUpdateAdapter = UpdateAdapter(
            database,
            'Series',
            ['Id'],
            (Series item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Path': item.Path,
                  'Year': item.Year,
                  'Quality': item.Quality,
                  'EpisodesID': item.EpisodesID,
                  'TagsID': item.TagsID,
                  'UserReviewID': item.UserReviewID
                }),
        _seriesDeletionAdapter = DeletionAdapter(
            database,
            'Series',
            ['Id'],
            (Series item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Path': item.Path,
                  'Year': item.Year,
                  'Quality': item.Quality,
                  'EpisodesID': item.EpisodesID,
                  'TagsID': item.TagsID,
                  'UserReviewID': item.UserReviewID
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Series> _seriesInsertionAdapter;

  final UpdateAdapter<Series> _seriesUpdateAdapter;

  final DeletionAdapter<Series> _seriesDeletionAdapter;

  @override
  Future<List<Series>?> getAllSeries() async {
    return _queryAdapter.queryList('SELECT * FROM Series',
        mapper: (Map<String, Object?> row) => Series(
            EpisodesID: row['EpisodesID'] as String,
            Id: row['Id'] as String,
            Name: row['Name'] as String,
            Path: row['Path'] as String,
            Year: row['Year'] as String?,
            Quality: row['Quality'] as String?,
            TagsID: row['TagsID'] as String?,
            UserReviewID: row['UserReviewID'] as String?));
  }

  @override
  Future<Series?> getSeriesByName(String name) async {
    return _queryAdapter.query('SELECT * FROM Series WHERE Name = ?1',
        mapper: (Map<String, Object?> row) => Series(
            EpisodesID: row['EpisodesID'] as String,
            Id: row['Id'] as String,
            Name: row['Name'] as String,
            Path: row['Path'] as String,
            Year: row['Year'] as String?,
            Quality: row['Quality'] as String?,
            TagsID: row['TagsID'] as String?,
            UserReviewID: row['UserReviewID'] as String?),
        arguments: [name]);
  }

  @override
  Future<void> addSeries(Series series) async {
    await _seriesInsertionAdapter.insert(series, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSeries(Series series) async {
    await _seriesUpdateAdapter.update(series, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSeries(Series series) async {
    await _seriesDeletionAdapter.delete(series);
  }
}

class _$EpisodeDao extends EpisodeDao {
  _$EpisodeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _episodeInsertionAdapter = InsertionAdapter(
            database,
            'Episode',
            (Episode item) => <String, Object?>{
                  'Id': item.Id,
                  'Quality': item.Quality,
                  'Path': item.Path
                }),
        _episodeUpdateAdapter = UpdateAdapter(
            database,
            'Episode',
            ['Id'],
            (Episode item) => <String, Object?>{
                  'Id': item.Id,
                  'Quality': item.Quality,
                  'Path': item.Path
                }),
        _episodeDeletionAdapter = DeletionAdapter(
            database,
            'Episode',
            ['Id'],
            (Episode item) => <String, Object?>{
                  'Id': item.Id,
                  'Quality': item.Quality,
                  'Path': item.Path
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Episode> _episodeInsertionAdapter;

  final UpdateAdapter<Episode> _episodeUpdateAdapter;

  final DeletionAdapter<Episode> _episodeDeletionAdapter;

  @override
  Future<Episode?> getEpisodeWithId(int id) async {
    return _queryAdapter.query('SELECT * FROM Episode WHERE Id = ?1',
        mapper: (Map<String, Object?> row) => Episode(
            Id: row['Id'] as String,
            Quality: row['Quality'] as String?,
            Path: row['Path'] as String),
        arguments: [id]);
  }

  @override
  Future<void> addEpisode(Episode episode) async {
    await _episodeInsertionAdapter.insert(episode, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEpisode(Episode episode) async {
    await _episodeUpdateAdapter.update(episode, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEpisode(Episode episode) async {
    await _episodeDeletionAdapter.delete(episode);
  }
}

class _$ReviewsDao extends ReviewsDao {
  _$ReviewsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _reviewInsertionAdapter = InsertionAdapter(
            database,
            'Review',
            (Review item) => <String, Object?>{
                  'Id': item.Id,
                  'ReviewText': item.ReviewText,
                  'Rating': item.Rating
                }),
        _reviewUpdateAdapter = UpdateAdapter(
            database,
            'Review',
            ['Id'],
            (Review item) => <String, Object?>{
                  'Id': item.Id,
                  'ReviewText': item.ReviewText,
                  'Rating': item.Rating
                }),
        _reviewDeletionAdapter = DeletionAdapter(
            database,
            'Review',
            ['Id'],
            (Review item) => <String, Object?>{
                  'Id': item.Id,
                  'ReviewText': item.ReviewText,
                  'Rating': item.Rating
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Review> _reviewInsertionAdapter;

  final UpdateAdapter<Review> _reviewUpdateAdapter;

  final DeletionAdapter<Review> _reviewDeletionAdapter;

  @override
  Future<Review?> getReviewWithId(int id) async {
    return _queryAdapter.query('SELECT * FROM Review WHERE Id = ?1',
        mapper: (Map<String, Object?> row) => Review(row['Id'] as String,
            row['ReviewText'] as String, row['Rating'] as int),
        arguments: [id]);
  }

  @override
  Future<void> addReview(Review review) async {
    await _reviewInsertionAdapter.insert(review, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateReview(Review review) async {
    await _reviewUpdateAdapter.update(review, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteReview(Review review) async {
    await _reviewDeletionAdapter.delete(review);
  }
}

class _$TagsDao extends TagsDao {
  _$TagsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _tagInsertionAdapter = InsertionAdapter(
            database,
            'Tag',
            (Tag item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Color': item.Color
                }),
        _tagUpdateAdapter = UpdateAdapter(
            database,
            'Tag',
            ['Id'],
            (Tag item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Color': item.Color
                }),
        _tagDeletionAdapter = DeletionAdapter(
            database,
            'Tag',
            ['Id'],
            (Tag item) => <String, Object?>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Color': item.Color
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Tag> _tagInsertionAdapter;

  final UpdateAdapter<Tag> _tagUpdateAdapter;

  final DeletionAdapter<Tag> _tagDeletionAdapter;

  @override
  Future<Tag?> getTagWithId(int id) async {
    return _queryAdapter.query('SELECT * FROM Tag WHERE Id = ?1',
        mapper: (Map<String, Object?> row) => Tag(
            row['Id'] as String, row['Name'] as String, row['Color'] as String),
        arguments: [id]);
  }

  @override
  Future<void> addTag(Tag tag) async {
    await _tagInsertionAdapter.insert(tag, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTag(Tag tag) async {
    await _tagUpdateAdapter.update(tag, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTag(Tag tag) async {
    await _tagDeletionAdapter.delete(tag);
  }
}
