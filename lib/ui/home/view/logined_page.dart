import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/app/app.dart';
import 'package:star_movie_3/ui/account/tab/account_information.dart';
import 'package:star_movie_3/ui/account/tab/transactions_history.dart';

import 'package:star_movie_3/ui/home/widgets/avatar.dart';

class Loginedpage extends StatefulWidget {
  const Loginedpage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Loginedpage());

  @override
  State<Loginedpage> createState() => _LoginedpageState();
}

class _LoginedpageState extends State<Loginedpage> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1B2B),
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Column(
        children: [
          // AppBarHome(
          //   title: 'Profile',
          //   signUp: true,
          //   title2: 'Log Out',
          //   onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          // ),
          Container(
            margin: const EdgeInsets.only(top: 24, bottom: 16),
            width: 140,
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Avatar(photo: user.photo),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.name ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  color: const Color(0xff19E58F).withOpacity(0.2),
                ),
                child: const Text(
                  'MEMBER',
                  style: TextStyle(
                    color: Color(0xff19E58F),
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email ?? '',
            style: textStyle2(16),
          ),
          Container(
            margin: const EdgeInsets.only(left: 28, right: 22, top: 40, bottom: 55),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
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
                    const Text(
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
              'Transactions History', 'ic_dollar.png', const Transaction()),
          buildGestureDetector('Rating App', 'ic_rating.png', const Scaffold()),
          buildGestureDetector('Privacy Policy', 'ic_folder.png', const Scaffold()),
        ],
      ),
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
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: const BoxDecoration(
            color: Color(0xff2B3543),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 13),
                  child: Image.asset(
                    'images/$image',
                    scale: 0.8,
                  ),
                ),
                Text(
                  title,
                  style: textStyle2(18),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
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




// Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Avatar(photo: user.photo),
//             const SizedBox(height: 4),
//             Text(user.email ?? '', style: textTheme.headline6),
//             const SizedBox(height: 4),
//             Text(user.name ?? '', style: textTheme.headline5),
//           ],
//         ),
//       ),