import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../data/model/video.dart';

class ItemVideo extends StatefulWidget {
  final List<VideoModel>? listvideo;
  const ItemVideo({
    Key? key,
    @required this.listvideo,
  }) : super(key: key);

  @override
  _ItemVideoState createState() => _ItemVideoState();
}

class _ItemVideoState extends State<ItemVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: widget.listvideo!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
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
                  // Positioned(
                  //   bottom: 15,
                  //     left: 15,
                  //     child: Container(
                  //       alignment: Alignment.center,
                  //   height: 30,
                  //   width: 60,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(7),
                  //       color: Color(0xFF0F1B2B)),
                  //       child:
                  // )),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Image.asset(
                      'images/play_button.png',
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 15,
              )),
    );
  }
}
