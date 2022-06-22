import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:star_movie_3/data/model/cast.dart';
import 'package:star_movie_3/data/model/movie_description.dart';
import 'package:star_movie_3/data/model/photo.dart';
import 'package:star_movie_3/data/model/review.dart';
import 'package:star_movie_3/data/model/video.dart';
import 'package:star_movie_3/data/repository/cast_repository.dart';
import 'package:star_movie_3/data/repository/moviedescription_repository.dart';

import '../../../data/repository/photo_repository.dart';
import '../../../data/repository/review_repository.dart';
import '../../../data/repository/video_repository.dart';


part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  PageController controller = PageController();
  MovieDescriptionRepository movieDescriptionRepository =
      MovieDescriptionRepository();
  CastAndCrewRepository castAndCrewRepository = CastAndCrewRepository();
  PhotoRepository photoRepository = PhotoRepository();
  VideoRepository videoRepository = VideoRepository();
  ReviewRepository reviewRepository = ReviewRepository();
  DescriptionCubit() : super(DescriptionState());
  Future<void> getMovieDescription(int movieid) async {
    final movieDescription = await movieDescriptionRepository.getMovieDescription(movieid);
    final cast = await castAndCrewRepository.getCastAndCrew(movieid);
    final backdrop = await photoRepository.getBackdrops(movieid);
    final poster = await photoRepository.getPosters(movieid);
    final video = await videoRepository.getVideo(movieid);
    final review = await reviewRepository.getReview(movieid);
    final List<Genres>? genre = movieDescription.genres;
    List<String?>? listGenre = genre?.map((e) => e.name).toList();
    String movieGenre = listGenre!.join(', ');
    emit(state.copyWith(
      movieDes: movieDescription,
      cast: cast!,
      backdrop: backdrop!,
      poster: poster!,
      video: video!,
      review: review!,
      genre: movieGenre,
    ));
  }

  void onChangeTab(int index) {
    emit(state.copyWith(selectedTab: index));
  }
}
