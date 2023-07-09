import 'dart:ui';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/modules/add/add.dart';
import 'package:egyuide/modules/home/newsfeed.dart';
import 'package:egyuide/modules/otherpages/SettingPage.dart';
import 'package:egyuide/modules/profile/showProfile.dart';
import 'package:egyuide/modules/states/states.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../modules/profile/profile.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  final String cert = 'assets/svg/cert.svg';

  List<Widget> screens =
  [
    News(),
    SettingPage(),
    States(),
    ProfilePage(userProfileName: '${username}',),

  ];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        void _onItemTapped(int index) {
          if(index == 3)
            cubit.getUserProfilePageData(userID: userID ?? 15);
          setState(() {
            _page = index;
          });
        }

        return Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            mc,
            sc,
          ],begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),

          ),
          child: Scaffold(
            backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : Color(0xd9ffffff),
            body:screens[_page],
            extendBody: true,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.selectedCatItem = null;
                cubit.selectedStateItem = null;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreatePost(),
                ));
              },
              child:
              Icon(Icons.add, size: 30,color: Colors.white,),

              backgroundColor:cubit.darkMode ? mc : Color(0xffff757c),

            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home_rounded,
                Icons.grid_view_rounded,
                Icons.share_location_rounded,
                Icons.person_rounded,
              ],

              activeIndex: _page,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.smoothEdge,
              leftCornerRadius: 15,
              rightCornerRadius: 15,
              inactiveColor: Color(0xff0e7886),
              iconSize: 30,
              height: 61,

              onTap: _onItemTapped,

              backgroundColor:Color(0x33fba8ac),
              activeColor: Color(0xffffffff),
              blurEffect: true,


            ),


          ),
        );
      },
    );
  }
}
