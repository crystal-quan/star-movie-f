import 'package:flutter/material.dart';

class AppBarMovie extends StatelessWidget {
  final String? title;
  final bool? forward;
  const AppBarMovie({Key? key, @required this.title, @required this.forward})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  child: Image.asset(
                    'images/ic_back.png',
                    color: Colors.white.withOpacity(0.5),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$title',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              (forward == true)
                  ? GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'images/ic_forward.png',
                        width: 24,
                        height: 24,
                      ),
                    )
                  : SizedBox(width: 24, height: 24)
            ],
          ),
        ),
        Divider(
          color: Color(0xFF2B3543),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
