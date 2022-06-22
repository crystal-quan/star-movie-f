import 'package:flutter/material.dart';


import '../../../../../data/model/cast.dart';
import '../../../../../widgets/app_bar/app_bar.dart';
import 'item_cast.dart';

class Cast extends StatefulWidget {
  final List<CastModel>? listcast;
  const Cast({
    Key? key,
    @required this.listcast,
  }) : super(key: key);
  @override
  State<Cast> createState() => _CastState();
}

class _CastState extends State<Cast> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFF0F1B2B),
          child: Column(
            children: [
              AppBarMovie(
                title: 'Cast & Crew',
                forward: false,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: ItemCast(listcast: widget.listcast!,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
