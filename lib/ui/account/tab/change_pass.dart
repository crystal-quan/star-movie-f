import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/utils/red_button.dart';
import 'package:star_movie_3/ui/utils/textField_custom.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';


class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1B2B),
      body: SafeArea(
        child: Column(
          children: [
            AppBarMovie(title: 'Change Password', forward: false),
            BuildTextFieldCustom(
                title: 'OLD PASSWORD', image: 'lock.png', infomation: ''),
            BuildTextFieldCustom(
                title: 'NEW PASSWORD', image: 'lock.png', infomation: ''),
            BuildTextFieldCustom(
                title: 'RE-TYPE PASSWORD', image: 'lock.png', infomation: ''),
            Spacer(),
            RedButton(
              title: 'Save Change',
              widget1: Scaffold(),
            ),
          ],
        ),
      ),
    );
  }
}
