import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/account/profile_logined.dart';
import 'package:star_movie_3/ui/utils/red_button.dart';
import 'package:star_movie_3/ui/utils/textField_custom.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1B2B),
      body: SafeArea(
        child: Column(
          children: [
            AppBarMovie(
              title: 'Sign Up',
              forward: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BuildTextFieldCustom(
                      controller: _controller,
                        title: 'USER NAME',
                        image: 'ic_user.png',
                        infomation: ''),
                    BuildTextFieldCustom(
                      controller: _controller,
                        title: 'EMAIL', image: 'mail.png', infomation: ''),
                    BuildTextFieldCustom(
                      controller: _controller,
                        title: 'PHONE', image: 'ic_phone.png', infomation: ''),
                    BuildTextFieldCustom(
                      controller: _controller,
                        title: 'BIRTH DAY',
                        image: 'calendar-line.png',
                        infomation: ''),
                    BuildTextFieldCustom(
                      controller: _controller,
                        title: 'PASSWORD', image: 'lock.png', infomation: ''),
                    BuildTextFieldCustom(
                      controller: _controller,
                        title: 'RE-TYPE PASSWORD',
                        image: 'lock.png',
                        infomation: ''),
                  ],
                ),
              )),
            ),
            RedButton(
              title: 'Create Account',
              widget1: ProfileLogined(),
            ),
          ],
        ),
      ),
    );
  }
}
