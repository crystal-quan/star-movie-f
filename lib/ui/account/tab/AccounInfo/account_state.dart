part of 'account_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class AccountState extends Equatable {
  const AccountState({
    this.birthday = '',
    this.name = '',
    this.phone = '',
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });
  final String birthday;
  final String name;
  final String phone;
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;

  factory AccountState.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return AccountState(
      name: data?['name'],
      email: data?['email'],
      phone: data?['phone'],
      birthday: data?['birthday'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (phone != null) "phone": phone,
      if (birthday != null) "birthday": birthday,
    };
  }

  @override
  List<Object> get props =>
      [email, password, confirmedPassword, status, phone, name, birthday];

  AccountState copyWith({
    String? birthday,
    String? phone,
    String? name,
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AccountState(
      birthday: birthday ?? this.birthday,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class City {
  final String? name;
  final String? state;
  final String? country;
  final bool? capital;
  final int? population;
  final List<String>? regions;

  City({
    this.name,
    this.state,
    this.country,
    this.capital,
    this.population,
    this.regions,
  });
}
