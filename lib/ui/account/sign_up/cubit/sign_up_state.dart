part of 'sign_up_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState(
      {this.birthday = '',
      this.name = '',
      this.phone = '',
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmedPassword = const ConfirmedPassword.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage,
      this.signUpId = ''});
  final String birthday;
  final String name;
  final String phone;
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;
  final String? signUpId;

  @override
  List<Object> get props => [
        email,
        password,
        confirmedPassword,
        status,
        phone,
        name,
        birthday,
        signUpId!
      ];

  SignUpState copyWith(
      {String? birthday,
      String? phone,
      String? name,
      Email? email,
      Password? password,
      ConfirmedPassword? confirmedPassword,
      FormzStatus? status,
      String? errorMessage,
      String? signUpId}) {
    return SignUpState(
        birthday: birthday ?? this.birthday,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        signUpId: signUpId ?? this.signUpId);
  }
}
