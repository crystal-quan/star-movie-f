import 'package:flutter/material.dart';
import 'package:star_movie_3/main.dart';
import 'package:star_movie_3/ui/home/home_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFE51937),
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
