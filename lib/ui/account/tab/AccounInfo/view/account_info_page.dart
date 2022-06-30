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
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      // backgroundColor: const Color(0xFF0F1B2B),
      // appBar: AppBar(
      //   title: const Text('Account Information'),
      //   backgroundColor: const Color(0xFF0F1B2B),
      // ),
      // bottomNavigationBar: GestureDetector(
      //   onTap: () => context.read<AccountCubit>().getInfomation('${user.id}'),
      //   child: Container(
      //       alignment: Alignment.center,
      //       child: Text(
      //         'Save Change',
      //         style: TextStyle(fontSize: 24),
      //       ),
      //       margin: EdgeInsets.symmetric(horizontal: 18),
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height * 0.06,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.all(Radius.circular(4)),
      //           color: Colors.red)),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<AccountCubit>(
          create: (_) => AccountCubit(),
          child: AccountInfomation(),
        ),
      ),
    );
  }
}
