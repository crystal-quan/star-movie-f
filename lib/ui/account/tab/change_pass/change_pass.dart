import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:star_movie_3/ui/account/tab/change_pass/change_pass_cubit.dart';
import 'package:star_movie_3/ui/utils/red_button.dart';
import 'package:star_movie_3/ui/utils/textField_custom.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';

class ChangePassPage extends StatelessWidget {
  const ChangePassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePassCubit(context.read<AuthenticationRepository>()),
      child: ChangePass(),
    );
  }
}

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  ChangePassCubit? _cubit;

  @override
  void initState() {
    _cubit = context.read<ChangePassCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B),
      body: SafeArea(
        child: BlocConsumer<ChangePassCubit, ChangePassState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                AppBarMovie(title: 'Change Password', forward: false),
                BuildTextFieldCustom(
                  title: 'OLD PASSWORD',
                  image: 'lock.png',
                  infomation: '',
                  change: (String oldPassWord) =>
                      _cubit?.oldPassChanged(oldPassWord),
                ),
                BuildTextFieldCustom(
                  title: 'NEW PASSWORD',
                  image: 'lock.png',
                  infomation: '',
                  change: (String password) =>
                      context.read<ChangePassCubit>().passwordChanged(password),
                ),
                BuildTextFieldCustom(
                    errorText: state.confirmedPassword.invalid
                        ? 'passwords do not match'
                        : null,
                    change: (String retypePass) =>
                        _cubit?.confirmedPasswordChanged(retypePass),
                    title: 'RE-TYPE PASSWORD',
                    image: 'lock.png',
                    infomation: ''),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.read<ChangePassCubit>().saveChangePass(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xffE51937),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Text(
                      'Save Change',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
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
