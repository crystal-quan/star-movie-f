import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_movie_3/data/config/api.dart';

import 'package:star_movie_3/data/model/photo.dart';

class PhotoRepository {
  Future<List<Backdrops>?> getBackdrops(int movieid) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/$movieid/images?api_key=${Config.apiKey}'));
    final backdrop = PhotoList.fromJson(json.decode(response.body)).backdrops;
    return backdrop;
  }
  Future<List<Posters>?> getPosters(int movieid) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/$movieid/images?api_key=${Config.apiKey}'));
    final poster = PhotoList.fromJson(json.decode(response.body)).posters;
    return poster;
  }
}