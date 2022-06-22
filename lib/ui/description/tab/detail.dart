import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:star_movie_3/ui/description/tab/movie_info/cast/item_cast.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/config/api.dart';
import '../../../data/model/cast.dart';
import '../../../data/model/photo.dart';
import '../../../data/model/video.dart';
import '../../movie/description/description_cubit.dart';
import 'movie_info/cast/cast.dart';
import 'movie_info/photo/photo.dart';
import 'movie_info/video/video.dart';

class DetailPage extends StatefulWidget {
  final List<CastModel>? listcast;
  final List<Backdrops>? listbackdrop;
  final List<VideoModel>? listvideo;
  const DetailPage({
    Key? key,
    @required this.listcast,
    @required this.listbackdrop,
    @required this.listvideo,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Synopsis',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          BlocBuilder<DescriptionCubit, DescriptionState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(right: 20),
                child: ReadMoreText(
                  '${state.movieDes!.overview}',
                  trimLines: 4,
                  delimiter: '',
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: TextStyle(fontSize: 14, color: Color(0xFF47CFFF)),
                  lessStyle: TextStyle(fontSize: 14, color: Color(0xFF47CFFF)),
                  style: TextStyle(
                      fontSize: 14, color: Colors.white.withOpacity(0.5)),
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          _buildRow(
            "Cast & Crew",
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Cast(
                  listcast: widget.listcast,
                );
              }));
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 280,
            child: ItemCast(
              listcast: widget.listcast,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _buildRow(
            "Photos",
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Photo(
                  listbackdrop: widget.listbackdrop,
                );
              }));
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 80,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.listbackdrop!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '${Config.baseImageUrl}${widget.listbackdrop![index].filePath}',
                      fit: BoxFit.contain,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    )),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              _buildRow(
                "Videos",
                () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Video(
                      listvideo: widget.listvideo,
                    );
                  }));
                },
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 100,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.listvideo!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          YoutubePlayer.getThumbnail(
                              videoId: widget.listvideo![index].key!,
                              quality: ThumbnailQuality.high),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Image.asset(
                          'images/play_button.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    )),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'View All',
            style: TextStyle(fontSize: 18, color: Color(0xFF47CFFF)),
          ),
        ),
      ],
    );
  }
}
