import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star_movie_3/app/app.dart';

import 'package:star_movie_3/ui/Splash_Screen/Splash_Screen.dart';

import 'my_app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

