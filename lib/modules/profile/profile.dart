import 'package:better_player/better_player.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/modules/otherpages/EditProfile.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:egyuide/modules/home/newsfeed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.userProfileName,}) : super(key: key);
  final String userProfileName;



  @override
  State<ProfilePage> createState() => _ProfilePageState(userProfileName,);
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;
  final String userProfileName;

  _ProfilePageState(this.userProfileName,);
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
                    cubit.darkMode ? Color(0xff0E1D36) : Color(0xffe5f8f6),
                    cubit.darkMode ? Color(0xff0E1D36) :Color(0xffffeeee),
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
                    style: TextStyle(color: cubit.darkMode ? sc : mc),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: ()
                    {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile(),));
                    },
                    icon: Icon(Icons.edit),
                    color: cubit.darkMode ? sc :  mc,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ) ,
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
                                      NetworkImage(cubit.userProfile.avatar),
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
                                  backgroundColor: int.parse(cubit.userProfile.postCount) <
                                      10
                                      ? ulc(level.silver)
                                      : int.parse(cubit.userProfile.postCount) <
                                      20
                                      ? ulc(level.bronze)
                                      : int.parse(cubit.userProfile.postCount) <
                                      50
                                      ? ulc(level.gold)
                                      : ulc(level.diamond),
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
                                '${userProfileName}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${cubit.userProfile.bio.data?.job ?? 'No Job'} ',
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
                            cubit.darkMode ? 'assets/imges/topper-darkmode.png': 'assets/imges/topper.png',
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
                            color: cubit.darkMode ? Colors.blueGrey : Colors.white,
                            minWidth: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            splashColor: sc.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: cubit.darkMode ? mc.withOpacity(0.4) : Colors.white,
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
                                          '${cubit.userProfile.postCount}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'عدد المنشورات',
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
                                if (int.parse(cubit.userProfile.postCount) > 0)
                                  ListView.separated(
                                    itemBuilder: (context, index) {
                                      var oldDate = DateTime.parse(
                                          '${cubit.userPostsrevers[index].createDate}');
                                      var newDate =
                                      DateFormat('MM/dd/yyyy hh:mm a')
                                          .format(oldDate);
                                      final Duration duration =
                                      DateTime.now().difference(oldDate);



                                      return Container(
                                        decoration: BoxDecoration(
                                            color: cubit.darkMode ? Color(0xff0E1D36) : Colors.white,
                                            borderRadius:
                                            BorderRadiusDirectional.all(
                                              Radius.circular(10),
                                            )),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                      NetworkImage(
                                                          cubit.userProfile.avatar),
                                                      backgroundColor:
                                                      mc,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                            '${userProfileName}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        if (duration
                                                            .inHours <
                                                            2)
                                                          Text(
                                                              'منذ ساعة'),
                                                        if (duration
                                                            .inHours ==
                                                            2)
                                                          Text(
                                                              'منذ ساعتان'),
                                                        if (duration.inHours >
                                                            2 &&
                                                            duration.inHours <
                                                                11)
                                                          Text(
                                                              'منذ ${duration.inHours} ساعات'),
                                                        if (duration
                                                            .inHours >
                                                            10)
                                                          Text(
                                                              'منذ ${duration.inHours} ساعة'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(Icons
                                                            .more_vert_rounded)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                      '${cubit.userPostsrevers[index].title}'),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  right: 8, left: 8),
                                              child: cubit.userPostsrevers[index]
                                                  .media![0].fileType!
                                                  .contains("image", 0)
                                                  ? Image.network(
                                                  "${cubit.userPostsrevers[index].media?[0].originalUrl}")
                                                  : ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                child: AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child: BetterPlayer.network(
                                                    "${cubit.allposts[index].media?[0].originalUrl}",
                                                    betterPlayerConfiguration:
                                                    BetterPlayerConfiguration(
                                                        looping: false,
                                                        handleLifecycle: true,
                                                        autoDispose: true,
                                                        aspectRatio: 16 / 9,
                                                        controlsConfiguration:
                                                        BetterPlayerControlsConfiguration(
                                                          enableProgressBar: true,
                                                          enableSkips: false,
                                                          enableOverflowMenu:
                                                          false,
                                                          enableProgressText:
                                                          false,
                                                          enableSubtitles: false,
                                                          enablePip: false,
                                                          backgroundColor:
                                                          Color(0xFFFFFFFF),
                                                          controlsHideTime:
                                                          Duration(
                                                              milliseconds:
                                                              30),
                                                          controlBarColor:
                                                          Color(0xf000000),
                                                          enableQualities: false,
                                                          playerTheme:
                                                          BetterPlayerTheme
                                                              .cupertino,
                                                          controlBarHeight: 40,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: cubit.userPostsrevers.length,
                                  ),
                                if (int.parse(cubit.userProfile.postCount) == 0 )
                                  Container(
                                    child: Center(
                                        child: Text(
                                          'لا محتوى بعد',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    color: sc,
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                    MediaQuery.of(context).size.height *
                                        .06,
                                  ),                                BadgesWidget(postCount: int.parse(cubit.userProfile.postCount)),
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

class BadgesWidget extends StatelessWidget {
  const BadgesWidget({Key? key, required this.postCount,}) : super(key: key);
  final int postCount;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: postCount < 10
          ? Material(
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
                    Text('New Member.', style: TextStyle(color: Colors.grey,)),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
          : postCount <
          20
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
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
                        Text('more than 10 POSTS.', style: TextStyle(color: Colors.grey,)),
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
                        Text('New Member.', style: TextStyle(color: Colors.grey,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : postCount <
          50
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

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
                        Text('more than 20 POSTS.', style: TextStyle(color: Colors.grey,)),
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
                        Text('more than 10 POSTS.', style: TextStyle(color: Colors.grey,)),
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
                        Text('New Member.', style: TextStyle(color: Colors.grey,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

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
                        backgroundColor: ulc(level.diamond),
                        radius: 25,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text('Diamond Badge', style: TextStyle(
                          color: ulc(level.gold),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),),
                        Text('more than 50 POSTS.', style: TextStyle(color: Colors.grey,)),
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
                        Text('more than 20 POSTS.', style: TextStyle(color: Colors.grey,)),
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
                        Text('more than 10 POSTS.', style: TextStyle(color: Colors.grey,)),
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
                        Text('New Member.', style: TextStyle(color: Colors.grey,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
