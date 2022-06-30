import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/app/bloc/app_bloc.dart';
import 'package:star_movie_3/ui/account/sign_up/cubit/sign_up_cubit.dart';
import 'package:star_movie_3/ui/account/tab/AccounInfo/cubit/account_cubit.dart';
import 'package:star_movie_3/ui/account/tab/change_pass.dart';
import 'package:star_movie_3/ui/home/widgets/avatar.dart';
import 'package:star_movie_3/ui/utils/red_button.dart';
import 'package:star_movie_3/ui/utils/textField_custom.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';

class AccountInfomation extends StatefulWidget {
  TextEditingController? userController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? birthdayController = TextEditingController();
  AccountInfomation(
      {Key? key,
      this.userController,
      this.birthdayController,
      this.emailController,
      this.phoneController})
      : super(key: key);

  @override
  State<AccountInfomation> createState() => _AccountInfomationState();
}

class _AccountInfomationState extends State<AccountInfomation> {
  // AccountCubit? _cubit;
  // @override
  // void initState() {
  //   final user = context.select((AppBloc bloc) => bloc.state.user);
  //   _cubit = context.read<AccountCubit>();
  //   super.initState();
  //   _cubit?.getInfomation(user.id);
  // }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    // final stateUse = context.select((SignUpCubit bloc) => bloc.state);
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B),
      bottomNavigationBar: GestureDetector(
        onTap: () => context.read<AccountCubit>().getInfomation('${user.id}'),
        child: Container(
            alignment: Alignment.center,
            child: Text(
              'Save Change',
              style: TextStyle(fontSize: 24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 18),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.red)),
      ),
      body: SafeArea(
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            return Column(
              children: [
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
                            controller: widget.userController,
                            title: 'USER NAME',
                            image: 'ic_user.png',
                            infomation: '${state.name}'),
                        BuildTextFieldCustom(
                            controller: widget.emailController,
                            title: 'EMAIL',
                            image: 'mail.png',
                            infomation: '${state.email}'),
                        BuildTextFieldCustom(
                            controller: widget.phoneController,
                            title: 'PHONE',
                            image: 'ic_phone.png',
                            infomation: '${state.phone}'),
                        BuildTextFieldCustom(
                            controller: widget.birthdayController,
                            title: 'BIRTHDAY',
                            image: 'calendar-line.png',
                            infomation: '${state.birthday}'),
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
            );
          },
        ),
      ),
    );
  }
}
