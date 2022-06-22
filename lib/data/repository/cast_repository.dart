import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/data/model/cast.dart';

class CastAndCrewRepository {
  Future<List<CastModel>?> getCastAndCrew(int movieid) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/$movieid/credits?api_key=${Config.apiKey}'));
    final cast = CastList.fromJson(json.decode(response.body)).cast;
    return cast;
  }
}