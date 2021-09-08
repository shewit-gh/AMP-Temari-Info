import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/rating/models/models.dart';

class RatingEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddRating extends RatingEvent {
  
  final Rating rating;

  AddRating(this.rating);
}

class GetRating extends RatingEvent {
  final String id;

  GetRating(this.id); 
}

class UpdateRating extends RatingEvent{
  final String id;
  final Rating rating;

  UpdateRating(this.id, this.rating);
}



