import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:star_movie_3/app/app.dart';
import 'package:star_movie_3/ui/account/login/cubit/login_cubit.dart';
import 'package:star_movie_3/ui/account/sign_up/cubit/sign_up_cubit.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(AccountState read, this._authenticationRepository,this.bloc)
      : super(AccountState());
  final AuthenticationRepository _authenticationRepository;

  // SignUpState? _signUpState;
  // LoginState? _loginState;
  AppBloc bloc;
  final db = FirebaseFirestore.instance;

  Future<void> getInfomation() async {
    final user = bloc.state.user;
    // final currenId = _signUpState?.signUpId ?? _loginState?.id;
    // print(currenId.toString());
    final docRef = await db.collection("users").doc('${user.id}}').get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
        print(data.toString());
        print(user.id);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
