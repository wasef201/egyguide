import 'dart:ui';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/modules/add/add.dart';
import 'package:egyuide/modules/home/newsfeed.dart';
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
  @override
  int _page = 0;
  final String cert = 'assets/svg/cert.svg';

  List<Widget> screens =
  [
 News(),
    States(),
    States(),
    ProfilePage(),

  ];
  int index = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _onItemTapped(int index) {
    index == 1
        ? _drawerKey.currentState?.openDrawer()
        : setState(() {
      _page = index;
    });
  }
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            mc,
            sc,
          ],begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),

          ),
          child: Scaffold(
            backgroundColor: Color(0xd9ffffff),
            key: _drawerKey,
            drawer:   Drawer(

              child:        Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        lc,
                                        sc,
                                      ],
                                      begin: AlignmentDirectional.topStart,
                                      end: AlignmentDirectional.bottomEnd),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/imges/p2.webp'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('عمرو المحمدي')
                          ],
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                            bottom: 23,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                            child: CircleAvatar(
                              backgroundColor: mc,
                              child: SvgPicture.asset(
                                cert,
                                color: Colors.white,
                                semanticsLabel: 'role',
                                height: 15,
                              ),
                              radius: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            body:screens[_page],
            extendBody: true,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreatePost(),
                ));
              },
              child:
              Icon(Icons.add, size: 30),

              backgroundColor: Color(0xffff757c),

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

              backgroundColor: Color(0x33fba8ac),
              activeColor: Color(0xffffffff),
              blurEffect: true,


            ),


          ),
        );
      },
    );
  }
}
