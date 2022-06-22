import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie/showtime/showtime_cubit.dart';

class PickDate extends StatefulWidget {
  const PickDate({Key? key}) : super(key: key);

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  ShowtimeCubit? _cubit;
  @override
  void initState() {
    _cubit = context.read<ShowtimeCubit>();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              _cubit?.calendarTab(0);
            },
            child: Container(
              child: Image.asset(
                'images/close_btn.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
