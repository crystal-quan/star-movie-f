import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/app/bloc/app_bloc.dart';
import 'package:star_movie_3/ui/account/tab/AccounInfo/cubit/account_cubit.dart';
import 'package:star_movie_3/ui/account/tab/AccounInfo/view/account_information.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AccountInfoPage());
  }

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocProvider<AccountCubit>(
          create: (_) => AccountCubit(context.read<AuthenticationRepository>()),
          child: AccountInfomation(),
        ),
      ),
    );
  }
}
