import 'package:flutter/material.dart';

class BuildTextFieldCustom extends StatelessWidget {
  const BuildTextFieldCustom(
      {Key? key,
      @required this.title,
      @required this.image,
      @required this.infomation,
      this.controller,
      this.hideText})
      : super(key: key);

  final String? title;
  final String? image;
  final String? infomation;
  final bool? hideText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '$title',
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
                color: Color(0xff2B3543),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: TextField(
                  controller: controller,
                  obscureText: hideText ?? false,
                  style: TextStyle(decorationColor: Color(0xff2B3543)),
                  decoration: InputDecoration(
                    hintText: '$infomation',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    icon: Image.asset(
                      'images/$image',
                      scale: 0.9,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
