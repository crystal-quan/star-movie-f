import 'package:flutter/material.dart';
import 'package:star_movie_3/ui/account/sign_up/view/sign_up_page.dart';

class AppBarHome extends StatelessWidget {
  final String? title;
  final bool? signUp;
  final String? title2;
  final dynamic onPressed;
  
  const AppBarHome({Key? key, @required this.title, this.signUp, this.title2,this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 12),
              child: Text(
                '$title',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            (signUp == true)
                ? TextButton(
                    onPressed: () =>onPressed ,        
                    child: Text(
                      '$title2',
                      style: TextStyle(color: Color(0xffE51937), fontSize: 18),
                    ))
                : SizedBox()
          ],
        ),
        Divider(
          color: Color(0xFF2B3543),
          height: 1,
          thickness: 1,
        ),
        // SizedBox(
        //   height: 16,
        // ),
      ],
    );
  }
}

// Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SignUpPage()),
//                       );