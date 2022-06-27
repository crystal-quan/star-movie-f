import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/app/bloc/app_bloc.dart';
import 'package:star_movie_3/ui/account/tab/change_pass.dart';
import 'package:star_movie_3/ui/home/widgets/avatar.dart';
import 'package:star_movie_3/ui/utils/red_button.dart';
import 'package:star_movie_3/ui/utils/textField_custom.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';

// ignore: must_be_immutable
class AccountInfomation extends StatefulWidget {
  TextEditingController? controller = TextEditingController();
  AccountInfomation({Key? key, this.controller}) : super(key: key);

  @override
  State<AccountInfomation> createState() => _AccountInfomationState();
}

class _AccountInfomationState extends State<AccountInfomation> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

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
                      width: 140,
                      height: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Avatar(photo: user.photo),
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
                        controller: widget.controller,
                        title: 'USER NAME',
                        image: 'ic_user.png',
                        infomation: user.name ?? user.id),
                    BuildTextFieldCustom(
                        controller: widget.controller,
                        title: 'EMAIL',
                        image: 'mail.png',
                        infomation: '${user.email}'),
                    BuildTextFieldCustom(
                        controller: widget.controller,
                        title: 'PHONE',
                        image: 'ic_phone.png',
                        infomation: '(+84) 363 226 994'),
                    BuildTextFieldCustom(
                        controller: widget.controller,
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
