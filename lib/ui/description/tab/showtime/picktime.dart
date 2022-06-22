import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../../../movie/showtime/showtime_cubit.dart';

class PickTime extends StatefulWidget {
  const PickTime({Key? key}) : super(key: key);

  @override
  State<PickTime> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
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
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildRow('Choose Date', true, true),
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 70,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: dates[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        )),
              ),
              buildRow('Choose Cinema', true, false),
              BlocBuilder<ShowtimeCubit, ShowtimeState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Color(0xFF2B3543),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          dropdownColor: Color(0xFF2B3543),
                          isExpanded: true,
                          style: TextStyle(color: Colors.white),
                          value: state.value,
                          items: cinema.map(buildDropdownItem).toList(),
                          onChanged: (value) => _cubit?.onChangedCinema(value!)),
                    ),
                  );
                },
              ),
              buildRow('2D', false, false),
              buildtime(),
              buildRow('Imax', false, false),
              buildtime(),

            ],
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
