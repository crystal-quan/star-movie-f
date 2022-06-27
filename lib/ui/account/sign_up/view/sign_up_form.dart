import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formz/formz.dart';
import 'package:star_movie_3/ui/account/sign_up/cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('USER NAME'),
              _NameInput(),
              const SizedBox(height: 18),
              const Text('EMAIL'),
              _EmailInput(),
              const SizedBox(height: 18),
              const Text('PHONE'),
              _PhoneInput(),
              const SizedBox(height: 18),
              const Text('BIRTHDAY'),
              _BirthdayInput(),
              const SizedBox(height: 18),
              const Text('PASSWORD'),
              _PasswordInput(),
              const SizedBox(height: 18),
              const Text('RE-TYPE PASSWORD'),
              _ConfirmPasswordInput(),
              const SizedBox(height: 18),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Image.asset('images/mail.png'),
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_phonelInput_textField'),
          onChanged: (phone) => context.read<SignUpCubit>().phoneChanged(phone),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            icon: Image.asset('images/ic_phone.png'),
            helperText: '',
          ),
        );
      },
    );
  }
}

class _BirthdayInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_birthdayInput_textField'),
          onChanged: (birthday) => context.read<SignUpCubit>().phoneChanged(birthday),
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            icon: Image.asset('images/ic_phone.png'),
            helperText: '',
          ),
        );
      },
    );
  }
}
class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_nameInput_textField'),
          onChanged: (name) => context.read<SignUpCubit>().phoneChanged(name),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            icon: Image.asset('images/ic_user.png'),
            helperText: '',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
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

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: InputDecoration(
            icon: Image.asset('images/lock.png'),
            helperText: '',
            errorText: state.confirmedPassword.invalid
                ? 'passwords do not match'
                : null,
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InkWell(
                key: const Key('signUpForm_continue_raisedButton'),
                onTap: state.status.isValidated
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: const Text('Create Account')),
              );
      },
    );
  }
}
