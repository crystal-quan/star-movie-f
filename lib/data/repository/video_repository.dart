import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/data/model/video.dart';

class VideoRepository {
  Future<List<VideoModel>?> getVideo(int movieid) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/movie/${movieid}/videos?api_key=${Config.apiKey}'));
    final videos = VideoList.fromJson(json.decode(response.body)).videolist;
    return videos;
  }
}