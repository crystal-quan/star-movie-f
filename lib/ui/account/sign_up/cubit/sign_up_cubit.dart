import 'dart:math';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([
          email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void phoneChanged(String value) {
    String phone = value;
    emit(
      state.copyWith(
        phone: phone,
      ),
    );
  }

  void nameChanged(String value) {
    String name = value;
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void birthdayChanged(String value) {
    String birthday = value;
    emit(
      state.copyWith(
        birthday: birthday,
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
          state.email,
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
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      final db = FirebaseFirestore.instance;
      final user = <String, dynamic>{
        'name': state.name,
        'email': state.email.value,
        'phone': state.phone,
        'birthday': state.birthday,
      };
      await db
          .collection('users')
          .doc(_authenticationRepository.currentUser.id)
          .set(user)
          .onError((e, _) => print("Error writing document: $e"));

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      emit(state.copyWith(signUpId: _authenticationRepository.currentUser.id));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
