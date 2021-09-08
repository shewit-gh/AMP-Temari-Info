import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/rating/blocs/rating_event.dart';
import 'package:temari_info_flutter/rating/blocs/rating_state.dart';
import 'package:temari_info_flutter/rating/models/models.dart';
import 'package:temari_info_flutter/rating/repo/rating_repo.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final RatingRepo ratingRepo;
  RatingBloc(this.ratingRepo) : super(InitialState());

  @override
  Stream<RatingState> mapEventToState(RatingEvent event) async* {
    if(event is GetRating) {
      yield LoadingState();
      try {
        List<Rating> rating = await ratingRepo.getRating(event.id);
        yield LoadedRating(rating);
      } catch (e) {
        yield LoadingRatingError('Error Loading Rating!');
      }
    }
    else if(event is UpdateRating) {
      yield LoadingState();
      try {
        await ratingRepo.updateRating(event.rating, event.id);
        yield UpdateSuccess();
        add(GetRating(event.id));
      } catch (e) {
        yield LoadingRatingError('Error Updating Rating!');
      }
    }
    else if(event is AddRating) {
      yield LoadingState();
      try {
      Rating rating = await ratingRepo.createRating(event.rating);
      yield AddingRatingSuccess();
      add(GetRating(rating.id));
        yield UpdateSuccess();
      } catch (e) {
        yield LoadingRatingError('Error Updating Rating!');
      }
    }

  }

}