// ignore_for_file: file_names

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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: const BoxDecoration(
                color: Color(0xff2B3543),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: TextField(
                  controller: controller,
                  obscureText: hideText ?? false,
                  style: const TextStyle(decorationColor: Color(0xff2B3543)),
                  decoration: InputDecoration(
                    hintText: '$infomation',
                    hintStyle: const TextStyle(
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
