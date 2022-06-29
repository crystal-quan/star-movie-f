import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:star_movie_3/app/app.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final authenticationRepository = AuthenticationRepository();
 
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: App(
      authenticationRepository: authenticationRepository,
    ));
  }
}
