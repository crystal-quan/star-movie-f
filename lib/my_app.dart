import 'package:flutter/material.dart';

import 'ui/Splash_Screen/Splash_Screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
