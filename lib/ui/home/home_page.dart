import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_movie_3/ui/account/account.dart';
import 'package:star_movie_3/ui/movie/movie_page.dart';
import 'package:star_movie_3/ui/notification/notification_page.dart';
import 'package:star_movie_3/ui/ticket/ticket_page.dart';

import 'home_cubit.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) {
            return HomeCubit();
          },
        ),
        // BlocProvider<AccountCubit>(
        //   create: (BuildContext context) {
        //     return AccountCubit();
        //   },
        // ),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit? _cubit;
  void _onItemTapped(int index) {
    _cubit!.onChangeScreen(index);
  }

  List<Widget> page = [
    MoviesPage(),
    TicketPage(),
    NotificationPage(),
    AccountPage(),
  ];
  @override
  void initState() {
    _cubit = context.read<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return page[state.selectedIndex!];
          },
        ),
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Color(0xFF2B3543), width: 1))),
              child: BottomNavigationBar(
                currentIndex: state.selectedIndex!,
                onTap: _onItemTapped,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 10,
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                      'images/movies.png',
                      color: (state.selectedIndex == 0)
                          ? Color(0xFF47CFFF)
                          : Colors.grey,
                    ),
                    backgroundColor: Color(0xFF0F1B2B),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                      'images/ticket.png',
                      color: (state.selectedIndex == 1)
                          ? Color(0xFF47CFFF)
                          : Colors.grey,
                    ),
                    backgroundColor: Color(0xFF0F1B2B),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                      'images/notification.png',
                      color: (state.selectedIndex == 2)
                          ? Color(0xFF47CFFF)
                          : Colors.grey,
                    ),
                    backgroundColor: Color(0xFF0F1B2B),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                      'images/account.png',
                      color: (state.selectedIndex == 3)
                          ? Color(0xFF47CFFF)
                          : Colors.grey,
                    ),
                    backgroundColor: Color(0xFF0F1B2B),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
