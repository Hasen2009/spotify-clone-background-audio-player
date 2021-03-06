import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/presentation/pages/HomePage.dart';
import 'package:spotify2_app/presentation/pages/PlayListPage.dart';
import 'package:spotify2_app/presentation/pages/ProfilePage.dart';
import 'package:spotify2_app/presentation/pages/SearchPage.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List taps = [HomePage(), SearchPage(), PlayListPage(), ProfilePage()];



  @override
  void initState() {
    super.initState();
    PlayerService.startPlayer();

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: taps[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              BlocProvider.of<PlayerCubit>(context).minifyPlayer();
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.grey[500],
              ),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.search,
                color: Colors.grey[500],
              ),
              label: 'Search',
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.library_music,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.library_music,
                color: Colors.grey[500],
              ),
              label: 'PlayList',
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.person,
                color: Colors.grey[500],
              ),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
          ],
        ),
      ),
    );
  }
}
