import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:star_movie_3/ui/description/tab/showtime/pickdate.dart';
import 'package:star_movie_3/ui/description/tab/showtime/picktime.dart';


import '../../../../widgets/app_bar/app_bar.dart';
import '../../../movie/showtime/showtime_cubit.dart';

class Showtime extends StatelessWidget {
  final String? title;
  final int? selectedTab;
  const Showtime({Key? key, this.title, this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ShowtimeCubit();
      },
      child: ShowtimePage(
        title: title!,
        selectedTab: selectedTab!,
      ),
    );
  }
}

class ShowtimePage extends StatefulWidget {
  final String? title;
  final int? selectedTab;
  const ShowtimePage({Key? key, this.title, this.selectedTab}) : super(key: key);

  @override
  State<ShowtimePage> createState() => _ShowtimePageState();
}

class _ShowtimePageState extends State<ShowtimePage> {
  ShowtimeCubit? _cubit;
  final today = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final _monthFormatter = DateFormat('MMM');
  final _weekdayFormatter = DateFormat('EEE');
  List<String> time = [
    '8:30 AM',
    '9:30 AM',
    '10:00 AM',
    '12:30 PM',
    '13:45 PM',
    '15:00 PM',
  ];
  final cinema = [
    'Paragon Cinema',
    'CGV Cinema',
    'BHD Cinema',
  ];
  @override
  void initState() {
    _cubit = context.read<ShowtimeCubit>();
    super.initState();
  }

  Widget build(BuildContext context) {
    final dates = <Widget>[];
    for (int i = 0; i < 7; i++) {
      final date = today.add(Duration(days: i));
      dates.add(BlocBuilder<ShowtimeCubit, ShowtimeState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              _cubit?.onChooseDate(i);
            },
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                    width: (state.chooseDate == i) ? 0 : 1),
                borderRadius: BorderRadius.circular(10),
                color: (state.chooseDate == i)
                    ? Color(0xFFF8C42F)
                    : Colors.transparent,
              ),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (i == 0)
                      ? Text(
                          'Today',
                          style: TextStyle(
                              color: (state.chooseDate == i)
                                  ? Colors.black
                                  : Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      : Text(
                          '${_dayFormatter.format(date)} ${_monthFormatter.format(date)}',
                          style: TextStyle(
                              color: (state.chooseDate == i)
                                  ? Colors.black
                                  : Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _weekdayFormatter.format(date).toUpperCase(),
                    style: TextStyle(
                        color: (state.chooseDate == i)
                            ? Colors.black
                            : Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          );
        },
      ));
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFF0F1B2B),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<ShowtimeCubit, ShowtimeState>(
            builder: (context, state) {
              return Column(
                children: [
                  AppBarMovie(
                    title: '${widget.title}',
                    forward: true,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Color(0xFF2C3F5B))),
                      height: 45,
                      child: Row(
                        children: [
                          buildTab("Detail", (widget.selectedTab == 0)),
                          buildTab("Reviews", (widget.selectedTab == 1)),
                          buildTab("Showtime", (widget.selectedTab == 2)),
                        ],
                      )),
                  (state.tabIndex == 0) ? PickTime() : PickDate(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffE51937),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Text(
                        (state.tabIndex == 0) ? 'Get Ticket' : 'Choose Date',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              );
            },
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
            color: (selected) ? Color(0xFFD9251D) : Colors.transparent),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                color: (selected) ? Colors.white : Color(0xFF2C3F5B),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String title, bool color, bool calendar) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: TextStyle(
                color: (color == true)
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          (calendar == true)
              ? BlocBuilder<ShowtimeCubit, ShowtimeState>(
                  builder: (context, state) {
                    return GestureDetector(
                      child: Image.asset('images/calendar.png'),
                      onTap: () {
                        _cubit?.calendarTab(1);
                      },
                    );
                  },
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget buildtime() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 115,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            childAspectRatio: 2 / 1,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xFF2B3543),
                border: Border(
                    bottom: BorderSide(color: Color(0xFFF8C42F), width: 1)),
              ),
              alignment: Alignment.center,
              child: Text(
                '${time[index]}',
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }

  DropdownMenuItem<String> buildDropdownItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
