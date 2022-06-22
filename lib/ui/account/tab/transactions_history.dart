import 'package:flutter/material.dart';
import 'package:star_movie_3/widgets/app_bar/app_bar.dart';


class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1B2B),
      body: SafeArea(
        child: Column(
          children: [
            AppBarMovie(title: 'Transactions History', forward: false),
            Container(
                margin: EdgeInsets.only(left: 18, right: 18, bottom: 18),
                child: Image.asset(
                  'images/atm.png',
                  fit: BoxFit.cover,
                )),
            buildContainer(true, 'John Wick 3: Parabellum', '54'),
            buildContainer(true, 'King of the Monsters', '38'),
            buildContainer(false, 'Bank Account', '60'),
            buildContainer(true, 'The Secret Life of Pets ', '54'),
          ],
        ),
      ),
    );
  }

  Container buildContainer(bool spenMoney, String title, String money) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
          color: Color(0xff2B3543),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: spenMoney
                      ? Color(0xff47CFFF).withOpacity(0.2)
                      : Color(0xffFBFF47).withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: spenMoney
                  ? Image.asset('images/bank_card.png')
                  : Image.asset('images/yellow_dolar.png'),
            ),
            RichText(
              text: TextSpan(
                text: spenMoney ? 'Booked Ticket ' : 'Transfer Money',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffFFFFFF),
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n$title',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 12)),
                ],
              ),
            ),
            Spacer(),
            RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                text: spenMoney ? '- \$$money.00' : '+ \$$money.00',
                style: TextStyle(
                  fontSize: 14,
                  color: spenMoney ? Color(0xffE51937) : Color(0xff19E58F),
                ),
                children: const <TextSpan>[
                  TextSpan(
                      text: '\n24 MAY, 2019',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
