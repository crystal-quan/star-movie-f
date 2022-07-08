import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:star_movie_3/ui/account/login/cubit/login_cubit.dart';
import 'package:star_movie_3/ui/home/home_page.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              const Text('USER NAME'),
              EmailInput(),
              const SizedBox(height: 16),
              const Text('PASS WORD'),
              _PasswordInput(),
              const SizedBox(height: 16),
              _LoginButton(),
              const SizedBox(height: 16),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status == FormzStatus.pure) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            backgroundColor: const Color(0xFF0F1B2B),
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppBarMovie(
                                  forward: false,
                                  title: 'Send a password reset email',
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Check your mail:\n ${state.email.value}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 26),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }
                  ;
                },
                builder: (context, state) {
                  return Center(
                    child: InkWell(
                      onTap: () => state.email.valid
                          ? context.read<LoginCubit>().forgotPass()
                          : null,
                      child: Text(
                        'Forgot Passwrod',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5), fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height > 800
                      ? MediaQuery.of(context).size.height / 5
                      : 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // _GoogleLoginButton(),
                  // const SizedBox(width: 8),
                  // _GoogleLoginButton(),
                  // const SizedBox(width: 8),
                  _GoogleLoginButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Image.asset('images/ic_user.png'),
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            icon: Image.asset('images/lock.png'),
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InkWell(
                key: const Key('loginForm_continue_raisedButton'),
                onTap: state.status.isValidated
                    ? () => context.read<LoginCubit>().logInWithCredentials()
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const Key('loginForm_googleLogin_raisedButton'),
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Color(0xffCB3E2D),
        ),
        child: const Icon(FontAwesomeIcons.google, color: Colors.white),
      ),
      onTap: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}
