import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/ui/description/description.dart';

import '../home/home_cubit.dart';


class ComingSoonTab extends StatefulWidget {
  const ComingSoonTab({Key? key}) : super(key: key);

  @override
  State<ComingSoonTab> createState() => _ComingSoonTabState();
}

class _ComingSoonTabState extends State<ComingSoonTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.upcomingMovies != null
            ? GridView.builder(
                // scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: state.upcomingMovies!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionScreen(
                                        movieid:
                                            state.upcomingMovies![index].id)));
                          },
                          child: Container(
                            child: Image.network(
                              '${Config.baseImageUrl}${state.upcomingMovies![index].posterPath}',
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
                              '${state.upcomingMovies![index].title}',
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
