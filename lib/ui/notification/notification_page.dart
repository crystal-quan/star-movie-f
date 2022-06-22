import 'package:flutter/material.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar_home.dart';



class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> notifications = <String>[
    'Congrat! You booked John Wick 3 movie ticket successfully.',
    'Hi Morgan. This is just a reminder for your movie today in 13:45 PM.',
    'You\'ve got an cashback for the past ticket booking.',
    'You just got the discount 30% for booking a movie in this week.',
    'Congrat! You booked John Wick 3 movie ticket successfully.'
  ];
  final List<String> time = <String>[
    '10:48:25 AM',
    '3 hours ago',
    '2 days ago',
    '5 days ago',
    '4 weeks ago'
  ];
  final List<String> icon = [
    'images/ic_like.png',
    'images/ic_noti.png',
    'images/ic_money.png',
    'images/ic_%.png',
    'images/ic_like.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF0F1B2B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarHome(title: 'Notifications',signUp: false,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 95 / 827,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15,),
                              Image.asset(
                                icon[index],
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(notifications[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.visible),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(time[index],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white.withOpacity(0.5),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(width: 30,)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xff2B3543),
                      height: 1,
                      thickness: 1,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
