import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:cache/cache.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:star_movie_3/app/app.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:star_movie_3/ui/account/login/cubit/login_cubit.dart';
import 'package:star_movie_3/ui/account/sign_up/cubit/sign_up_cubit.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import '../../../../packages/authentication_repository/test/authentication_repository_test.dart';

const _mockFirebaseUserUid = 'mock-uid';
const _mockFirebaseUserEmail = 'mock-email';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockCacheClient extends Mock implements CacheClient {}

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockFirebaseUser extends Mock implements firebase_auth.User {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

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

  TestWidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  const email = 'test@gmail.com';
  const password = 't0ps3cret42';

  group(
    'LoginCubit check',
    () {
      late CacheClient cache;
      late firebase_auth.FirebaseAuth firebaseAuth;
      late GoogleSignIn googleSignIn;
      late AuthenticationRepository authenticationRepository;
      late LoginCubit loginCubit;
      late MockAuthenticationRepository _authenticationRepository;
      const accessToken = 'access-token';
      const idToken = 'id-token';

      setUp(
        () async {
          cache = MockCacheClient();
          firebaseAuth = MockFirebaseAuth();
          googleSignIn = MockGoogleSignIn();
          _authenticationRepository = MockAuthenticationRepository();
          authenticationRepository = AuthenticationRepository(
            cache: cache,
            firebaseAuth: firebaseAuth,
            googleSignIn: googleSignIn,
          );
          final googleSignInAuthentication = MockGoogleSignInAuthentication();
          final googleSignInAccount = MockGoogleSignInAccount();
          when(() => googleSignInAuthentication.accessToken)
              .thenReturn(accessToken);
          when(() => googleSignInAuthentication.idToken).thenReturn(idToken);
          when(() => googleSignInAccount.authentication)
              .thenAnswer((_) async => googleSignInAuthentication);
          when(() => googleSignIn.signIn())
              .thenAnswer((_) async => googleSignInAccount);
          when(() => firebaseAuth.signInWithCredential(any()))
              .thenAnswer((_) => Future.value(MockUserCredential()));
          when(() => firebaseAuth.signInWithPopup(any()))
              .thenAnswer((_) => Future.value(MockUserCredential()));
        },
      );
      setUpAll(() {
        registerFallbackValue(FakeAuthCredential());
        registerFallbackValue(FakeAuthProvider());
      });

      test('Login Cubit test create', () {
        LoginCubit loginCubit = LoginCubit(authenticationRepository);
        expect(loginCubit.state, const LoginState());
      });

      test(
        'nhap Email nhung khong nhap mk  return status.invalid',
        () {
          LoginCubit loginCubit = LoginCubit(authenticationRepository);
          String value = 'test@gmail.com';
          final addmail = loginCubit.emailChanged(value);
          expect(loginCubit.state.email, Email.dirty(value));
          expect(loginCubit.state.status, FormzStatus.invalid);
        },
      );
      test(
        'nhap mk nhung ko nhap email  return status.invalid',
        () {
          LoginCubit loginCubit = LoginCubit(authenticationRepository);
          String value = '1234asdf';
          final addpass = loginCubit.passwordChanged(value);
          expect(loginCubit.state.password, Password.dirty(value));
          expect(loginCubit.state.status, FormzStatus.invalid);
        },
      );
      test(
        'nhap email va mat khau hop le ',
        () {
          LoginCubit loginCubit = LoginCubit(authenticationRepository);
          String email = "Email@gmail.com";
          String password = '1234asdf';
          loginCubit.emailChanged(email);
          loginCubit.passwordChanged(password);
          expect(loginCubit.state.status, FormzStatus.valid);
        },
      );
      test('test fogot passWord', () {
         LoginCubit loginCubit = LoginCubit(authenticationRepository);
         
      },);
      // test(
      //   'mail return pure',
      //   () {
      //     final value = 'email@gmail.com';
      //     // final email = Email.dirty(value);
      //     final Email preEmail = loginCubit.state.email;
      //     loginCubit.emailChanged(value);
      //     final Email currEmail = loginCubit.state.email;
      //     expect(currEmail, Email.pure());
      //   },
      // );
    },
  );
}
