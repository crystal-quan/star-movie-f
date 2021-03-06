import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String? title;
  final Widget? widget1;
  const RedButton({Key? key, this.title, this.widget1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                      backgroundColor: const Color(0xff0F1B2B),
                      body: SafeArea(
                        child: Container(child:widget1),
                      ),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color(0xffE51937),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Text(
          '$title',
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
