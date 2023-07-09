import 'package:better_player/better_player.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/models/HomeModel.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                cubit.darkMode ? Color(0xff0E1D36) : mc,
                cubit.darkMode ? Color(0xff0E1D36) : sc,
              ],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : Color(0xd9ffffff),
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.1,
                title: Container(
                  padding: EdgeInsetsDirectional.only(
                    start: 5,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: cubit.darkMode ? Colors.blueGrey : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all()),
                  child: TextFormField(
                    controller: searchText,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value) {
                      print(searchText.text.toString());
                      cubit.getSearch(keyword: searchText.text);
                    },
                    style: TextStyle(
                      color: mc,
                      fontFamily: 'Poppins',
                    ),
                    decoration: InputDecoration(
                      hintText: 'ادخل عبارة البحث',
                    ),
                  ),
                ),
                actions: [
                  if (searchText.text != '')
                    IconButton(
                        onPressed: () {
                          searchText.clear();
                          cubit.getSearch(keyword: searchText.text);
                          cubit.chang();
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 30,
                        )),
                ],
                backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : mc,
                elevation: 0,
              ),
              body: WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context, false);
                  searchText.clear();
                  cubit.getSearch(keyword: searchText.text);
                  cubit.counter2 = 0;
                  return false;
                },
                child: Column(
                  children: [
                    if(cubit.counter2 == 1)
                    if (cubit.postsSearched.posts!.length > 0 &&
                        state is getSearchSuccess)
                      Expanded(
                        child: ListView.separated(
                          cacheExtent: 1,
                          addRepaintBoundaries: true,
                          itemBuilder: (context, index) {
                            var oldDate = DateTime.parse(
                                '${cubit.postsSearched.posts![index].createdAt}');
                            var newDate = DateFormat('MM/dd/yyyy hh:mm a')
                                .format(oldDate);
                            final Duration duration =
                                DateTime.now().difference(oldDate);

                            return Container(
                              decoration: BoxDecoration(
                                  color: cubit.darkMode ? mc.withOpacity(0.3) : Colors.white,
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
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                cubit.postsSearched.posts![index].avatar),
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
                                                  '${cubit.postsSearched.posts![index].user.name}',
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
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
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
                                        Text(
                                            '${cubit.postsSearched.posts![index].title}'),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 8),
                                    child: cubit.postsSearched.posts![index]
                                            .media![0].fileType!
                                            .contains("image", 0)
                                        ? Image.network(
                                            "${cubit.postsSearched.posts![index].media?[0].originalUrl}")
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: BetterPlayer.network(
                                                "${cubit.postsSearched.posts![index].media?[0].originalUrl}",
                                                betterPlayerConfiguration:
                                                    BetterPlayerConfiguration(
                                                        aspectRatio: 16 / 9,
                                                        controlsConfiguration:
                                                            BetterPlayerControlsConfiguration(
                                                          enableProgressBar:
                                                              true,
                                                          enableSkips: false,
                                                          enableOverflowMenu:
                                                              false,
                                                          enableProgressText:
                                                              false,
                                                          enableSubtitles:
                                                              false,
                                                          enablePip: false,
                                                          backgroundColor:
                                                              Color(0xFFFFFFFF),
                                                          controlsHideTime:
                                                              Duration(
                                                                  milliseconds:
                                                                      30),
                                                          controlBarColor:
                                                              Color(0xf000000),
                                                          enableQualities:
                                                              false,
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
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemCount: cubit.postsSearched.posts!.length,
                        ),
                      ),
                    if ((state is! getSearchSuccess &&
                        state is! getSearchLoading) || cubit.counter2 == 0)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                          'ابحث عن ما تريد',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                        color: sc,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                    if(cubit.counter2 == 1)
                    if (cubit.postsSearched.posts!.length == 0 &&
                        state is getSearchSuccess &&
                        state is! getSearchLoading)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                          'لا يوجد نتائج مطابقة',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                        color: sc,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                    if (state is getSearchLoading)
                      Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: sc,
                          ))),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
