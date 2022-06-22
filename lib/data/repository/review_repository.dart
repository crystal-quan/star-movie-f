import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/data/model/review.dart';

class ReviewRepository {
  Future<List<ReviewModel>?> getReview(int movieid) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/$movieid/reviews?api_key=${Config.apiKey}'));
    final reviews = ReviewList.fromJson(json.decode(response.body)).review;
    return reviews;
  }
}