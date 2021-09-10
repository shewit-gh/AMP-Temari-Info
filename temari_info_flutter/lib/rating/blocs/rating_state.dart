import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/rating/models/models.dart';

class RatingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends RatingState {}

class LoadingState extends RatingState {}

class LoadedRating extends RatingState {
  final List<Rating> rating;

  LoadedRating(this.rating);
}

class UpdateSuccess extends RatingState {
  final int rating;
  UpdateSuccess(this.rating);
}

class AddingRatingSuccess extends RatingState {}

class LoadingRatingError extends RatingState {
  final String message;

  LoadingRatingError(this.message);
}

class LoadedState extends RatingState {}