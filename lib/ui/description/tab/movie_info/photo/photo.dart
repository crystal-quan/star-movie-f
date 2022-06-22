import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/description/tab/movie_info/photo/item_photo.dart';


import '../../../../../data/model/photo.dart';
import '../../../../../widgets/app_bar/app_bar.dart';


class Photo extends StatefulWidget {
  final List<Backdrops>? listbackdrop;
  const Photo({
    Key? key,
    @required this.listbackdrop,
  }) : super(key: key);
  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
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
                title: 'Photos',
                forward: false,
              ),
              Expanded(
                  child: Container(
                    child: ItemPhoto(listbackdrop: widget.listbackdrop,),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
