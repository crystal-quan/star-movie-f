import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/account/sign_up/view/sign_up_page.dart';
import 'package:star_movie_3/ui/account/tab/account_information.dart';
import 'package:star_movie_3/ui/account/tab/transactions_history.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar_home.dart';



class ProfileLogined extends StatefulWidget {
  const ProfileLogined({Key? key}) : super(key: key);

  @override
  State<ProfileLogined> createState() => _ProfileLoginedState();
}

class _ProfileLoginedState extends State<ProfileLogined> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarHome(
          title: 'Profile',
          signUp: false,
          title2: 'SignUp',
          onPressed:Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      ) ,
        ),
        Container(
          margin: EdgeInsets.only(top: 24, bottom: 16),
          width: 140,
          height: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'images/ic_avatar.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Crystal Quan    ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: Color(0xff19E58F).withOpacity(0.2),
              ),
              child: Text(
                'MEMBER',
                style: TextStyle(
                  color: Color(0xff19E58F),
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'crystalliu25081987@gmail.com',
          style: textStyle2(16),
        ),
        Container(
          margin: EdgeInsets.only(left: 28, right: 22, top: 40, bottom: 55),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '123',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'TOTAL POINTS',
                    style: textStyle2(14),
                  )
                ],
              ),
              Container(
                width: 1,
                color: Colors.white.withOpacity(0.5),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '06',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'MOVIES WATCHED',
                    style: textStyle2(14),
                  )
                ],
              ),
            ],
          ),
        ),
        buildGestureDetector(
            'Account Information', 'ic_account.png', AccountInfomation()),
        buildGestureDetector(
            'Transactions History', 'ic_dollar.png', Transaction()),
        buildGestureDetector('Rating App', 'ic_rating.png', Scaffold()),
        buildGestureDetector('Privacy Policy', 'ic_folder.png', Scaffold())
      ],
    );
  }

  GestureDetector buildGestureDetector(
      String title, String image, Widget widget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
            color: Color(0xff2B3543),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 13),
                  child: Image.asset(
                    'images/$image',
                    scale: 0.8,
                  ),
                ),
                Text(
                  '$title',
                  style: textStyle2(18),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset(
                  'images/ctrl-right.png',
                  scale: .8,
                ))
          ],
        ),
      ),
    );
  }

  TextStyle textStyle2(double fontsize) {
    return TextStyle(
        fontSize: fontsize,
        color: Colors.white.withOpacity(0.5),
        fontWeight: FontWeight.normal);
  }
}
