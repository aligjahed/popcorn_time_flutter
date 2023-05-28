import 'package:floor/floor.dart';

import '../models/Tag.dart';

@dao
abstract class TagsDao{
  @Query("SELECT * FROM Tag WHERE Id = :id")
  Future<Tag?> getTagWithId(int id);

  @insert
  Future<void> addTag(Tag tag);

  @update
  Future<void> updateTag(Tag tag);

  @delete
  Future<void> deleteTag(Tag tag);
}