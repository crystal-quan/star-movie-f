import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/description/tab/movie_info/video/item_video.dart';

import '../../../../../data/model/video.dart';
import '../../../../../widgets/app_bar/app_bar.dart';



class Video extends StatefulWidget {
  final List<VideoModel>? listvideo;
  const Video({
    Key? key,
    @required this.listvideo,
  }) : super(key: key);
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFF0F1B2B),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              AppBarMovie(
                title: 'Videos',
                forward: false,
              ),
              Expanded(
                  child: Container(
                    child: ItemVideo(listvideo: widget.listvideo,),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
