part of 'description_cubit.dart';

class DescriptionState {
  final int? selectedTab;
  final MovieDescriptionModel? movieDes;
  final List<CastModel>? cast;
  final List<Backdrops>? backdrop;
  final List<Posters>? poster;
  final List<VideoModel>? video;
  final List<ReviewModel>? review;
  final String? genre;
  DescriptionState({
    this.selectedTab = 0,
    this.movieDes,
    this.cast,
    this.backdrop,
    this.poster,
    this.video,
    this.review,
    this.genre,
  });
  DescriptionState copyWith({
    int? selectedTab,
    MovieDescriptionModel? movieDes,
    List<CastModel>? cast,
    List<Backdrops>? backdrop,
    List<Posters> ? poster,
    List<VideoModel>? video,
    List<ReviewModel>? review,
    String? genre,
  }) {
    return DescriptionState(
      selectedTab: selectedTab ?? this.selectedTab,
      movieDes: movieDes ?? this.movieDes,
      cast: cast ?? this.cast,
      backdrop: backdrop ?? this.backdrop,
      poster: poster ?? this.poster,
      video: video ?? this.video,
      review: review ?? this.review,
      genre: genre ?? this.genre,
    );
  }

 
}
