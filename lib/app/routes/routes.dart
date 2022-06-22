import 'package:flutter/widgets.dart';
import 'package:star_movie_3/app/app.dart';
import 'package:star_movie_3/ui/account/login/view/login_page.dart';
import 'package:star_movie_3/ui/home/view/logined_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [Loginedpage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
