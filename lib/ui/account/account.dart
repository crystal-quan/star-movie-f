import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:star_movie_3/app/app.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final authenticationRepository = AuthenticationRepository();
  // AccountCubit _cubit;
  @override
  void initState() {
    // _cubit = context.read<AccountCubit>();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
            //   child: Scaffold(
            //     backgroundColor:Color(0xFF0F1B2B) ,
            //       body: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: App(
      authenticationRepository: authenticationRepository,
    ))
        // ))
        ;
  }
}
