import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/data/model/movie_list.dart';

class UpComingMovieRepository {
  Future<List<MovieModel>?> getUpComingMovies() async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/upcoming?api_key=${Config.apiKey}'));
    final movies = MovieList
        .fromJson(json.decode(response.body))
        .movieslist;
    return movies;
  }
}
