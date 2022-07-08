part of 'change_pass_cubit.dart';

enum CheckPass { passSuccess, passError, retypePassFail }

enum ConfirmPasswordValidationError { invalid }

class ChangePassState extends Equatable {
  const ChangePassState({
    this.status = FormzStatus.pure,
    this.password = const Password.pure(),
    this.oldPassword = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
  });
  final FormzStatus status;
  final Password password;
  final Password oldPassword;
  final ConfirmedPassword confirmedPassword;
  @override
  List<Object> get props => [oldPassword, confirmedPassword, password, status];

  ChangePassState copyWith({
    Password? oldPassword,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
  }) {
    return ChangePassState(
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        status: status ?? this.status,
        oldPassword: oldPassword ?? this.oldPassword);
  }
}
