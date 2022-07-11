part of 'login_cubit.dart';

enum SendResetPassEmail { notSend , sendSucces, sendError }

class LoginState extends Equatable {
  const LoginState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage,
      this.sendResetPassEmail = SendResetPassEmail.notSend,
      this.id});

  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;
  final String? id;
  final SendResetPassEmail sendResetPassEmail;

  @override
  List<Object> get props => [email, password, status];

  LoginState copyWith(
      {Email? email,
      Password? password,
      FormzStatus? status,
      String? errorMessage,
      SendResetPassEmail? sendResetPassEmail,
      String? id}) {
    return LoginState(
      sendResetPassEmail: sendResetPassEmail??this.sendResetPassEmail,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        id: id ?? this.id);
  }
}
