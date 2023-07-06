
import 'package:better_player/better_player.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/modules/profile/showProfile.dart';
import 'package:egyuide/modules/search/search.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TopReviewer {
  final String image;
  final String name;
  final level ul;

  TopReviewer(this.image, this.name, this.ul);
}

enum level {
  diamond,
  gold,
  silver,
  bronze,
}

Color ulc(level ul) {
  Color color;
  switch (ul) {
    case level.diamond:
      color = Color(0xffe978fc);
      break;
    case level.gold:
      color = Color(0xffe7b238);
      break;
    case level.silver:
      color = Color(0xffa9b1bd);
      break;
    case level.bronze:
      color = Color(0xffa95b2b);
      break;
  }
  return color;
}

class News extends StatelessWidget {
  List<TopReviewer> top = [
    TopReviewer('assets/imges/p1.webp', 'احمد علي', level.diamond),
    TopReviewer('assets/imges/p2.webp', 'عمرو محمد', level.bronze),
    TopReviewer('assets/imges/p3.webp', 'حسناء يوسف', level.gold),
    TopReviewer('assets/imges/p4.webp', 'الاء علي', level.silver),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is UserProfileDataSuccessState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShowProfile(
                    userProfileName: state.username ?? 'UnKnown',
                  )));
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        cubit.myscrollController.addListener(() {

          if (cubit.myscrollController.position.pixels ==
              cubit.myscrollController.position.maxScrollExtent) {
            if (cubit.counter < 1) {
              cubit.counter++;
              cubit.page += 1;
              print("## Try Number ${cubit.page}");
              cubit.getMorePosts(page: cubit.page);
              cubit.makeShowBtnAppear(btn: true,);
            }
          }

          if (cubit.myscrollController.offset ==
              0.0)
            cubit.makeShowBtnAppear(btn: false);

        });

        return ConditionalBuilder(
          condition: cubit.isHomeGet &&
              cubit.istTopRankedGet &&
              state is! UserProfileDataLoadingState &&
              state is! GetFollowDataLoading &&
              state is! GetFollowDataLoading,
          builder: (BuildContext context) => SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: cubit.myscrollController,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image(
                                  image: AssetImage('assets/imges/EgyGuide.png'),
                                  width: 120,
                                ),
                                Text('اهلا يا ${username}',
                                    style: TextStyle(color: mc, fontSize: 20)),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(),));
                                  },
                                  icon: CircleAvatar(
                                      backgroundColor: Color(0x4dffffff),
                                      child: Icon(Icons.search_rounded)),
                                  color: mc,
                                ),
                                IconButton(
                                  onPressed: () {
                                    print(cubit.homePOsts.posts.length);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: Color(0x4dffffff),
                                    child: Image(
                                        image: AssetImage('assets/imges/cert.png')),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'الاكثر تقييما',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          width: double.infinity,
                          height: 100,
                          child: ListView.separated(
                            cacheExtent: 0.5,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                cubit.getUnFollowedUsers(
                                    userID: cubit.topRanked.data[index].userId,
                                    username: cubit.topRanked.data[index].name,
                                  image: cubit.topRanked.data[index].image,
                                );
                              },
                              child: TopRevItem(
                                model: TopReviewer(
                               cubit.topRanked.data[index].image,
                                  cubit.topRanked.data[index].name,
                                  int.parse(cubit
                                              .topRanked.data[index].postsCount) <
                                          10
                                      ? level.silver
                                      : int.parse(cubit.topRanked.data[index]
                                                  .postsCount) <
                                              20
                                          ? level.bronze
                                          : int.parse(cubit.topRanked.data[index]
                                                      .postsCount) <
                                                  50
                                              ? level.gold
                                              : level.diamond,
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            itemCount: cubit.topRanked.data.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'الاكثر رواجاً',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (cubit.allposts.length > 0)
                          ListView.separated(
                            addRepaintBoundaries: true,
                            cacheExtent: 0.5,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var oldDate = DateTime.parse(
                                  '${cubit.allposts[index].createDate}');
                              var newDate =
                                  DateFormat('MM/dd/yyyy hh:mm a').format(oldDate);
                              final Duration duration =
                                  DateTime.now().difference(oldDate);

                              if (index == cubit.allposts.length - 1 &&
                                  cubit.noMorePosts)
                                return (Container(
                                  child: Center(child: Text('لا منشورات أخرى')),
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsetsDirectional.only(
                                    bottom: 50,
                                    top: 20,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  color: Colors.yellow[100],
                                ));

                              if (index == cubit.allposts.length - 1 &&
                                  !cubit.noMorePosts)
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              else {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadiusDirectional.all(
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Material(
                                            child: InkWell(
                                              child: Row(
                                                children: [
                                                  if(cubit.allposts[index].avatar != null)
                                                    CircleAvatar(
                                                    backgroundImage:
                                                      NetworkImage(cubit.allposts[index].avatar.toString()),
                                                    backgroundColor: mc,
                                                  ),
                                                  if(cubit.allposts[index].avatar == null)
                                                    CircleAvatar(
                                                      backgroundImage:
                                                      AssetImage('assets/imges/p2.webp'),
                                                      backgroundColor: mc,
                                                    ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          '${cubit.allposts[index].user!.name}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                      if (duration.inHours < 2)
                                                        Text('منذ ساعة'),
                                                      if (duration.inHours == 2)
                                                        Text('منذ ساعتان'),
                                                      if (duration.inHours > 2 &&
                                                          duration.inHours < 11)
                                                        Text(
                                                            'منذ ${duration.inHours} ساعات'),
                                                      if (duration.inHours > 10)
                                                        Text(
                                                            'منذ ${duration.inHours} ساعة'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                cubit.getUnFollowedUsers(
                                                    userID: int.parse(cubit
                                                        .allposts[index].userId),
                                                    username: cubit.allposts[index]
                                                        .user!.name,
                                                  image: cubit.allposts[index].avatar,
                                                );
                                              },
                                            ),
                                            color: Colors.transparent,
                                          ),
                                          Row(
                                            children: [
                                              if (cubit.othersIDMenu.contains(
                                                      int.parse(cubit
                                                          .allposts[index]
                                                          .userId)) &&
                                                  state is! FollowLoadingState)
                                                MaterialButton(
                                                  onPressed: () {
                                                    cubit.geFollowUser(
                                                        userID: int.parse(cubit
                                                            .allposts[index]
                                                            .userId));
                                                  },
                                                  child: Text('متابعة'),
                                                  highlightColor: mc,
                                                ),
                                              if (!cubit.othersIDMenu.contains(
                                                      int.parse(cubit
                                                          .allposts[index]
                                                          .userId)) &&
                                                  state is! UnFollowLoading)
                                                Material(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        cubit.makeUnFollowProcess(
                                                            userID: int.parse(cubit
                                                                .allposts[index]
                                                                .userId));
                                                      },
                                                      icon: Icon(
                                                        Icons.group_remove_outlined,
                                                        color: Colors.white,
                                                      )),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(10))),
                                                  color: Colors.grey[300],
                                                ),
                                              if (state is FollowLoadingState ||
                                                  state is UnFollowLoading)
                                                CircularProgressIndicator(
                                                  color: sc,
                                                ),
                                              IconButton(
                                                  onPressed: () {
                                                    cubit
                                                        .myscrollController.position
                                                        .animateTo(0,
                                                            duration: Duration(
                                                                milliseconds: 1000),
                                                            curve: Curves.ease);
                                                  },
                                                  icon: Icon(
                                                      Icons.more_vert_rounded)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${cubit.allposts[index].title}'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8),
                                        child: cubit
                                                .allposts[index].media![0].fileType!
                                                .contains("image", 0)
                                            ? Image.network(
                                                "${cubit.allposts[index].media?[0].originalUrl}")
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
/*
                                                    showControls: true,
                                                    showControlsOnInitialize: false,
*/
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
                              }
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: cubit.allposts.length,
                          ),
                        if (cubit.allposts.length == 0)
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
                            height: MediaQuery.of(context).size.height * .06,
                          ),
                      ],
                    ),
                  ),
                  if (cubit.allposts.length > 10 && cubit.showbtn)
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.08),
                      child: IconButton(
                        onPressed: ()
                        {
                          cubit.myscrollController.position.animateTo(0,duration: Duration(milliseconds: 1000),curve: Curves.ease);
                        },
                        icon: CircleAvatar(child: Icon(Icons.arrow_upward),backgroundColor: mc,),
                      ),
                    ),
                ],
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

class TopRevItem extends StatelessWidget {
  final TopReviewer model;
  final String cert = 'assets/svg/cert.svg';

  const TopRevItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  padding: EdgeInsets.all(3),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(model.image),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(model.name)
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
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: CircleAvatar(
              backgroundColor: ulc(model.ul),
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
    );
  }
}
