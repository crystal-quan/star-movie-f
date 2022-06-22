import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/data/model/movie_description.dart';

class MovieDescriptionRepository {
  Future<MovieDescriptionModel> getMovieDescription(int movieid) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/$movieid?api_key=${Config.apiKey}'));
    final moviesDes = MovieDescriptionModel.fromJson(json.decode(response.body));
    return moviesDes;
  }
}