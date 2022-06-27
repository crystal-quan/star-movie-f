import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar_home.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF0F1B2B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarHome(
              title: 'Tickets',
              signUp: false,
            ),
            Expanded(
                child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 12, bottom: 50),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: ClipRRect(
                            child: Image.asset(
                              'images/img_tickets.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: Container(
                              color: const Color(0xff2B3543),
                              child: Container(
                                margin: const EdgeInsets.only(left: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        flex: 4,
                                        fit: FlexFit.tight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text(
                                              'John Wick 3: Parabellum',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              'THEATRE',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            const Text(
                                              'Paragon Cinema',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )),
                                    Flexible(
                                        flex: 5,
                                        fit: FlexFit.loose,
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('DATE',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    )),
                                                const Text(
                                                  '24 May, 2019',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('HALL',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                            )),
                                                        const Text(
                                                          'C',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 18,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('ROW',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                            )),
                                                        const Text(
                                                          'E',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                            Flexible(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  Text('TIME',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                      )),
                                                  const Text(
                                                    '8:30 - 10:00 AM',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                  Text('SEAT',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                      )),
                                                  const Text(
                                                    'E4, E5',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ]))
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            )),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Image.asset('images/mavach.png'),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'P A R',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 57,
                                      ),
                                      Text('3 1 1 7 7 0 1 3 2 0 6 3 7 5',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
              },
              // containerWidth: 342,
              // containerHeight: 532,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: MediaQuery.of(context).size.height,
              itemCount: 4,
              layout: SwiperLayout.TINDER,
              onTap: (index) {},
            ))
          ],
        ),
      ),
    ));
  }
}
