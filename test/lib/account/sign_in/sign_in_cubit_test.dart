import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:star_movie_3/app/app.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:star_movie_3/ui/account/login/cubit/login_cubit.dart';
import 'package:star_movie_3/ui/account/sign_up/cubit/sign_up_cubit.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': const <String, String>{},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      final arguments = call.arguments as Map<String, dynamic>;
      return <String, dynamic>{
        'name': arguments['appName'],
        'options': arguments['options'],
        'pluginConstants': const <String, String>{},
      };
    }

    return null;
  });
  group(
    'EmailChanged',
    () {
      late LoginCubit loginCubit;
      late FirebaseException firebaseException;

      setUp(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp();
          final authenticationRepository = AuthenticationRepository();
          await authenticationRepository.user.first;
          loginCubit = LoginCubit(authenticationRepository);
        },
      );
      test(
        'mail return pure',
        () {
          final value = 'email@gmail.com';
          // final email = Email.dirty(value);
          final Email preEmail = loginCubit.state.email;
          loginCubit.emailChanged(value);
          final Email currEmail = loginCubit.state.email;
          expect(currEmail, Email.pure());
        },
      );
    },
  );
}
