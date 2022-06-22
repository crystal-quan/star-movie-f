import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/ui/movie/coming_soon_tab.dart';
import 'package:star_movie_3/ui/movie/now_showing_tab.dart';

import '../home/home_cubit.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<HomeCubit>();
    super.initState();
    _cubit.getMovies();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF0F1B2B),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Star Movies',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Color(0xFF2C3F5B))),
                      height: 45,
                      child: Row(
                        children: [
                          buildTab("Now Showing", () {
                            _cubit.onChangeTab(0);
                          }, (state.selectedTab == 0)),
                          buildTab("Coming Soon", () {
                            _cubit.onChangeTab(1);
                          }, (state.selectedTab == 1)),
                        ],
                      ));
                },
              ),
              Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (prev, current) {
                  return prev.selectedTab != current.selectedTab;
                },
                builder: (context, state) {
                  return PageView(
                    controller: _cubit.controller,
                    physics: NeverScrollableScrollPhysics(),
                    children: [NowShowingTab(), ComingSoonTab()],
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab(@required String title, VoidCallback onTap, bool selected) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: (selected) ? Color(0xFFD9251D) : Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (selected) ? Image.asset('images/play_button.png') : SizedBox(),
            SizedBox(
              width: (selected) ? 10 : 0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    color: (selected) ? Colors.white : Color(0xFF2C3F5B),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
