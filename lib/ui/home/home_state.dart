part of 'home_cubit.dart';

@immutable
class HomeState {
  final int? selectedIndex;
  final int? selectedTab;
  final List<MovieModel>? nowplayingMovies;
  final List<MovieModel>? upcomingMovies;
  const HomeState(
      {this.selectedIndex = 0,
      this.selectedTab = 0,
      this.nowplayingMovies,
      this.upcomingMovies});
  HomeState copyWith({
    int? selectedIndex,
    int? selectedTab,
    List<MovieModel>? nowplayingMovies,
    List<MovieModel>? upcomingMovies,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedTab: selectedTab ?? this.selectedTab,
      nowplayingMovies: nowplayingMovies ?? this.nowplayingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }


}
