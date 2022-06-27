import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/ui/account/login/cubit/login_cubit.dart';
import 'package:star_movie_3/ui/account/login/view/login_form.dart';
import 'package:star_movie_3/ui/account/sign_up/view/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B),
      appBar: AppBar(
          actions: [_SignUpButton()],
          title: const Text('Login'),
          backgroundColor: const Color(0xFF0F1B2B)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),
          )),
      child: const Text(
        'SIGN UP',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
