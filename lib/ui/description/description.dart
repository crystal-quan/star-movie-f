import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:star_movie_3/data/config/api.dart';
import 'package:star_movie_3/ui/description/tab/detail.dart';
import 'package:star_movie_3/ui/description/tab/review.dart';
import 'package:star_movie_3/ui/description/tab/showtime/showtime.dart';
import 'package:star_movie_3/ui/movie/description/description_cubit.dart';



class DescriptionScreen extends StatelessWidget {
  final int? movieid;

  const DescriptionScreen({Key? key, this.movieid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return DescriptionCubit();
      },
      child: DescriptionPage(
        movieid: movieid,
      ),
    );
  }
}

class DescriptionPage extends StatefulWidget {
  final int? movieid;

  const DescriptionPage({Key? key, @required this.movieid})
      : assert(movieid != null, 'cannot be null'),
        super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  DescriptionCubit? _cubit;
  void initState() {
    _cubit = context.read<DescriptionCubit>();
    super.initState();
    _cubit?.getMovieDescription(widget.movieid!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF0F1B2B),
            child: BlocBuilder<DescriptionCubit, DescriptionState>(
              builder: (context, state) {
                return state.movieDes != null &&
                        state.cast != null &&
                        state.backdrop != null &&
                        state.poster != null &&
                        state.video != null
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                    child: Blur(
                                  blur: 0.5,
                                  child: Image.network(
                                    '${Config.baseImageUrl}${state.movieDes!.backdropPath}',
                                    fit: BoxFit.cover,
                                    scale: 1,
                                  ),
                                )),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 30, 20, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                              'images/ic_back.png',
                                              color: Colors.white,
                                            ),
                                          ),
                                          Image.asset(
                                            'images/ic_share.png',
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 250,
                                      width: 150,
                                      child: Image.network(
                                          '${Config.baseImageUrl}${state.movieDes?.posterPath}'),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: Text(
                              '${state.movieDes?.title}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${state.movieDes!.runtime!~/ 60}h ${state.movieDes!.runtime! % 60}m',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('${state.genre}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 16,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${(state.movieDes!.voteAverage! / 2).toStringAsFixed(1)}/5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                RatingBarIndicator(
                                  rating: state.movieDes!.voteAverage! / 2,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border:
                                        Border.all(color: Color(0xFF2C3F5B))),
                                height: 45,
                                child: Row(
                                  children: [
                                    buildTab("Detail", () {},
                                        (state.selectedTab == 0)),
                                    buildTab("Reviews", () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ReviewPage(
                                          title: state.movieDes?.title,
                                          selectedTab: 1,
                                          rating: state.movieDes?.voteAverage,
                                          listreview: state.review,
                                        );
                                      }));
                                    }, (state.selectedTab == 1)),
                                    buildTab("Showtime", () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Showtime(
                                          title: state.movieDes!.title!,
                                          selectedTab: 2,
                                        );
                                      }));
                                    }, (state.selectedTab == 2)),
                                  ],
                                )),
                            DetailPage(
                              listcast: state.cast,
                              listbackdrop: state.backdrop,
                              listvideo: state.video,
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTab(String title, VoidCallback onTap, bool selected) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: (selected) ? Color(0xFFD9251D) : Colors.transparent),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                color: (selected) ? Colors.white : Color(0xFF2C3F5B),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }
}
