import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import '../../../data/config/api.dart';
import '../../../data/model/review.dart';
import '../../../widgets/app_bar/app_bar.dart';

class ReviewPage extends StatefulWidget {
  final String? title;
  final int? selectedTab;
  final double? rating;
  final List<ReviewModel>? listreview;
  const ReviewPage(
      {Key? key, this.title, this.selectedTab, this.rating, this.listreview})
      : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xFF0F1B2B),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              AppBarMovie(
                title: '${widget.title}',
                forward: true,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: const Color(0xFF2C3F5B))),
                  height: 45,
                  child: Row(
                    children: [
                      buildTab("Detail", (widget.selectedTab == 0)),
                      buildTab("Reviews", (widget.selectedTab == 1)),
                      buildTab("Showtime", (widget.selectedTab == 2)),
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${(widget.rating! / 2).toStringAsFixed(1)}/5',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingBarIndicator(
                    rating: widget.rating! / 2,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.listreview!.length} reviews',
                style: TextStyle(
                    fontSize: 16, color: Colors.white.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.listreview!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF2B3543),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RatingBarIndicator(
                                      rating: widget.rating! / 2,
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 30.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${widget.listreview![index].content}',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            Align(alignment: Alignment.centerLeft,widthFactor: 19,child: Image.asset('images/triangle.png'),),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                Flexible(
                                    flex: 2,
                                    child: SizedBox(
                                      width: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: (widget.listreview![index]
                                                    .authorDetails!.avatarPath !=
                                                null)
                                            ? Image.network(
                                                '${Config.baseImageUrl}${widget.listreview![index].authorDetails!.avatarPath}',
                                                fit: BoxFit.cover,
                                                height: 50,
                                              )
                                            : const SizedBox(
                                                height: 50,
                                              ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    '${widget.listreview![index].author}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 30,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab(String title, bool selected) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: (selected) ? const Color(0xFFD9251D) : Colors.transparent),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 15,
              color: (selected) ? Colors.white : const Color(0xFF2C3F5B),
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
