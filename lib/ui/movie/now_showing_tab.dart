import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/ui/description/description.dart';

import '../home/home_cubit.dart';


class NowShowingTab extends StatefulWidget {
  const NowShowingTab({Key? key}) : super(key: key);

  @override
  State<NowShowingTab> createState() => _NowShowingTabState();
}

class _NowShowingTabState extends State<NowShowingTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.nowplayingMovies != null
            ? GridView.builder(
                // scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: state.nowplayingMovies!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DescriptionScreen(
                                movieid:
                                    state.nowplayingMovies![index].id);
                            }));
                          },
                          child: Container(
                            child: Image.network(
                              '${Config.baseImageUrl}${state.nowplayingMovies![index].posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${state.nowplayingMovies![index].title}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  );
                })
            : Container(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
