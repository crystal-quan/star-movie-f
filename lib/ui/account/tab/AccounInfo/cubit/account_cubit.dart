import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:star_movie_3/app/bloc/app_bloc.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._authenticationRepository) : super(const AccountState());

  final db = FirebaseFirestore.instance;
  final AuthenticationRepository _authenticationRepository;
  Future<void> getInfomation() async {
    final docRef = await db
        .collection("users")
        .doc(_authenticationRepository.currentUser.id)
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
        emit(state.copyWith(
            phone: data['phone'],
            birthday: data['birthday'],
            name: data['name'],
            email: data['email']));
        print(data['phone']);
      },
      onError: (e) => print("Error getting document: $e"),
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

  void phoneChanged(String value) {
    String phone = value;
    emit(
      state.copyWith(
        phone: phone,
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

  Future<void> saveChangeInfomation() async {
    try {
      final user = <String, dynamic>{
        'name': state.name,
        'email': state.email,
        'phone': state.phone,
        'birthday': state.birthday,
      };
      await db
          .collection('users')
          .doc(_authenticationRepository.currentUser.id)
          .set(user)
          .onError((e, _) => print("Error writing document: $e"));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }
}

// {birthday: 111122222, phone: 12345555, name: quanquan, id: 5NptrlOQT0QOPb0i9KTwsGWm2ks1, email: quanquan@gmail.com}
