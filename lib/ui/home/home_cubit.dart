import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:star_movie_3/data/model/movie_list.dart';
import 'package:star_movie_3/data/repository/nowplaying_repository.dart';
import 'package:star_movie_3/data/repository/upcoming_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  PageController controller = PageController();
  NowPlayingMovieRepository nowplayingRepository = NowPlayingMovieRepository();
  UpComingMovieRepository upcomingRepository = UpComingMovieRepository();
  HomeCubit() : super(HomeState());

  Future<void> getMovies() async {
    final nowplayingMovies = await nowplayingRepository.getNowPlayingMovies();
    final upcomingMovies = await upcomingRepository.getUpComingMovies();
    emit(state.copyWith(
        nowplayingMovies: nowplayingMovies, upcomingMovies: upcomingMovies));
  }

  void onChangeScreen(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void onChangeTab(int index) {
    controller.jumpToPage(index);
    emit(state.copyWith(selectedTab: index));
  }
}
