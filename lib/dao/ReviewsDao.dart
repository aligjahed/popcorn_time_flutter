import 'package:floor/floor.dart';
import 'package:popcorn_time_flutter/models/Review.dart';

@dao
abstract class ReviewsDao{
  @Query("SELECT * FROM Review WHERE Id = :id")
  Future<Review?> getReviewWithId(int id);

  @insert
  Future<void> addReview(Review review);
  
  @update
  Future<void> updateReview(Review review);

  @delete
  Future<void> deleteReview(Review review);
}