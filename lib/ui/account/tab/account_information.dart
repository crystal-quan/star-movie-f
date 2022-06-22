import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/account/tab/change_pass.dart';
import 'package:star_movie_3/ui/utils/red_button.dart';
import 'package:star_movie_3/ui/utils/textField_custom.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';


// ignore: must_be_immutable
class AccountInfomation extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  AccountInfomation({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B),
      bottomNavigationBar: const RedButton(
        title: 'Save Change',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarMovie(title: 'Account Information', forward: false),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24, bottom: 16),
                      width: 118,
                      height: 118,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'images/ic_avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Change Photo',
                        style: TextStyle(
                            color: Color(0xff47CFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    BuildTextFieldCustom(
                        controller: controller,
                        title: 'USER NAME',
                        image: 'ic_user.png',
                        infomation: 'Crystal Quan'),
                    BuildTextFieldCustom(
                        controller: controller,
                        title: 'EMAIL',
                        image: 'mail.png',
                        infomation: 'Crystalliu25081987@gmail.com'),
                    BuildTextFieldCustom(
                        controller: controller,
                        title: 'PHONE',
                        image: 'ic_phone.png',
                        infomation: '(+84) 363 226 994'),
                    BuildTextFieldCustom(
                        controller: controller,
                        title: 'BIRTHDAY',
                        image: 'calendar-line.png',
                        infomation: 'May 29, 1994'),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePass(),
                            ));
                      },
                      child: const Text(
                        'Change Password',
                        style: TextStyle(
                            color: Color(0xffE51937),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
