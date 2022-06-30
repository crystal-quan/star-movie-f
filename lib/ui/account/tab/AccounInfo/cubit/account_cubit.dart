import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState());

  final db = FirebaseFirestore.instance;

  Future<void> getInfomation(String id) async {
    final docRef = await db.collection("users").doc('${id}').get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
        emit(state.copyWith(
            phone: data['phone'],
            birthday: data['birthday'],
            name: data['name'],
            email: data['email']));
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}


// {birthday: 111122222, phone: 12345555, name: quanquan, id: 5NptrlOQT0QOPb0i9KTwsGWm2ks1, email: quanquan@gmail.com}
