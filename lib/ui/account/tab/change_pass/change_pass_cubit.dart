// ignore_for_file: prefer_final_fields

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(this._authenticationRepository) : super(ChangePassState());
  AuthenticationRepository _authenticationRepository;

  void oldPassChanged(String value) {
    final oldPassword = Password.dirty(value);
    // final confirmedPassword = ConfirmedPassword.dirty(
    //   password: password.value,
    //   value: state.retypePassword.value,
    // );
    emit(
      state.copyWith(
        oldPassword: oldPassword,
        // retypePassword: confirmedPassword,
        // status: Formz.validate([
        //   state.newPassword,
        //   password,
        //   confirmedPassword,
        // ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        status: Formz.validate([
          password,
          confirmedPassword,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        status: Formz.validate([
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> saveChangePass() async {
    try {
      // final userCredential = await FirebaseAuth.instance.currentUser;
      // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //     email: _authenticationRepository.currentUser.email.toString(),
      //     password: state.password.toString());

      // emit(state.copyWith(status: FormzStatus.submissionSuccess));
      // emit(state.copyWith(password: state.password));
      await FirebaseAuth.instance.currentUser!
          .updatePassword(state.password.value);

      return print('quanbv - ${state.password.value}');

      // emit(state.copyWith(newPassword: state.newPassword));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
