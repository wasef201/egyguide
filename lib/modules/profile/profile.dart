import 'package:better_player/better_player.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:egyuide/modules/home/newsfeed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.isUserProfileDataGet,
          builder: (context) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xffe5f8f6),
                    Color(0xffffeeee),
                  ],
                  stops: [
                    0.1,
                    0.5
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.center),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                automaticallyImplyLeading:false,
                titleSpacing: 0,
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,

                title: Padding(
                  padding: EdgeInsetsDirectional.only(start: 15),
                  child: Text(
                    'الصفحة الشخصية',
                    style: TextStyle(color: mc),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    color: mc,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                  end: 10,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff59cdc4),
                                        Color(0xffef9ca0),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                      AssetImage('assets/imges/p1.webp',),
                                    ),
                                    radius: 33,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  child: Image(
                                    image: AssetImage('assets/imges/cert.png'),
                                    width: 13,
                                    color: Colors.white,
                                  ),
                                  radius: 15,
                                  backgroundColor: ulc(level.gold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${username}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if(cubit.userProfile.bio.data!.job!.isNotEmpty)
                                Text(
                                '${cubit.userProfile.bio.data?.job} ',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Image.asset(
                            'assets/imges/topper.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 50,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              currentIndex = 1;
                              setState(() {
                                print(currentIndex);
                              });
                            },
                            child: Image.asset(
                              'assets/imges/cert.png',
                              width: 20,
                            ),
                            elevation: 5,
                            padding: EdgeInsets.all(17),
                            color: Colors.white,
                            minWidth: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            splashColor: sc.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '${cubit.userProfile.followers}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'متابعين',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      color: Colors.grey[350],
                                      width: 2,
                                      height: 50,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${cubit.userProfile.following}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'يتابع',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      color: Colors.grey[350],
                                      width: 2,
                                      height: 50,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '1.3 مليون',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'اعجاب',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                // MaterialButton(
                                //   onPressed: () {
                                //     print(userID);
                                //   },
                                //   child: Text(
                                //     'متابعة',
                                //     style: TextStyle(
                                //       fontSize: 18,
                                //     ),
                                //   ),
                                //   color: sc,
                                //   textColor: Colors.white,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(20)),
                                //   padding: EdgeInsets.symmetric(
                                //     horizontal: 25,
                                //     vertical: 5,
                                //   ),
                                //   elevation: 0,
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ContainedTabBarView(
                              tabBarViewProperties: TabBarViewProperties(
                                physics: NeverScrollableScrollPhysics(),
                              ),

                              initialIndex: currentIndex,
                              tabBarProperties: TabBarProperties(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: mc,
                                labelColor: sc,
                                unselectedLabelColor: mc,
                                margin: EdgeInsets.only(
                                  bottom: 10,
                                ),
                              ),onChange: (index) {
                              currentIndex = index;
                            },
                              tabs: [
                                Text('المنشورات'),
                                Text('البادجات'),
                                Text('الاكثر رواجا'),
                                Text('المفضلة'),
                              ],
                              views: [
                                ReelsWidget(),
                                BadgesWidget(),
                                Container(color: Colors.blue),
                                Container(color: Colors.orange),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF757C),
              )),
        );
      },

    );
  }
}

class ReelsWidget extends StatelessWidget {
  const ReelsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BadgesWidget extends StatelessWidget {
  const BadgesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[350],
                    child: CircleAvatar(
                      child: Image.asset('assets/imges/cert.png',color: Colors.white,fit: BoxFit.contain,),
                      backgroundColor: ulc(level.gold),
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text('Gold Badge', style: TextStyle(
                        color: ulc(level.gold),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),),
                      Text('got 10K love for Reels.', style: TextStyle(color: Colors.grey,)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey[350],
          height: 1,
          width: MediaQuery.of(context).size.width,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[350],
                    child: CircleAvatar(
                      child: Image.asset('assets/imges/cert.png',color: Colors.white,fit: BoxFit.contain,),
                      backgroundColor: ulc(level.bronze),
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text('Bronze Badge', style: TextStyle(
                        color: ulc(level.bronze),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),),
                      Text('got 10K love for Reels.', style: TextStyle(color: Colors.grey,)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey[350],
          height: 1,
          width: MediaQuery.of(context).size.width,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[350],
                    child: CircleAvatar(
                      child: Image.asset('assets/imges/cert.png',color: Colors.white,fit: BoxFit.contain,),
                      backgroundColor: ulc(level.silver),
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text('Silver Badge', style: TextStyle(
                        color: ulc(level.silver),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),),
                      Text('got 1K Followers.', style: TextStyle(color: Colors.grey,)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
