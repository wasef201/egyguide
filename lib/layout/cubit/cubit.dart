import 'dart:io';

import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/models/HomeModel.dart';
import 'package:egyuide/models/SearchPosts.dart';
import 'package:egyuide/models/TopRankedModel.dart';
import 'package:egyuide/models/UserProfileModel.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:egyuide/utilities/dio_helper.dart';
import 'package:egyuide/utilities/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // BottomNavigationBar
  int currentIndex = 1;

  void changeIndex({required int index}) {
    currentIndex = index;
  }

  // Home Posts
  List<PostsData> allposts = [];
  late HomePosts homePOsts;
  bool isHomeGet = false;
  bool showUnFollowButton = false;
  int counter = 0;

  void getHomePosts() {
    emit(HomePostsLoadingState());

    DioHelper.getData(
      url: 'posts?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3&page=1',
      token: token,
    ).then((value) {
      homePOsts = HomePosts.fromJson(value.data);
      homePOsts.posts.forEach((element) {
        allposts.add(element);
      });

      print(showUnFollowButton);
      emit(HomePostsGetSuccessState());
      isHomeGet = true;
    }).catchError((error) {
      isHomeGet = true;
      print("##ERRROR ${error.toString()}");
      emit(HomePostsGetErrorState(error.toString()));
    });

    emit(FollowButtonLoading());
    DioHelper.postData(
      url:
          'users/profile/${userID}?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      late UserProfile userProfile;
      userProfile = UserProfile.fromJson(value.data);
      if (userProfile.following > 0)
        showUnFollowButton = true;
      else
        showUnFollowButton = false;
      emit(FollowButtonSuccess());
    }).catchError((error) {
      print("###ERROR");
      print(error.toString());
      emit(FollowButtonError());
    });
  }

  // GET M o r e    P o s t s

  int page = 1;
  ScrollController myscrollController = ScrollController();
  bool noMorePosts = false;
  bool showbtn = false;

  void makeShowBtnAppear({required bool btn}) {
    emit(LoadingShowButton());
    showbtn = btn;
    emit(SuccessShowButton());
  }

  void getMorePosts({required int page}) {
    emit(HomePostsLoadingState());

    DioHelper.getData(
      url: 'posts?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3&page=$page',
      token: token,
    ).then((value) {
      late HomePosts _homePosts;
      _homePosts = HomePosts.fromJson(value.data);
      if (_homePosts.posts.length > 0)
        _homePosts.posts.forEach((element) {
          allposts.add(element);
        });
      else
        noMorePosts = true;
      emit(HomePostsGetSuccessState());
      counter = 0;
    }).catchError((error) {
      print("##ERRROR ${error.toString()}");
      emit(HomePostsGetErrorState(error.toString()));
    });

    emit(FollowButtonLoading());
    DioHelper.postData(
      url:
          'users/profile/${userID}?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      late UserProfile userProfile;
      userProfile = UserProfile.fromJson(value.data);
      if (userProfile.following > 0)
        showUnFollowButton = true;
      else
        showUnFollowButton = false;
      emit(FollowButtonSuccess());
    }).catchError((error) {
      print("###ERROR");
      print(error.toString());
      emit(FollowButtonError());
    });
  }

  // Top Ranked
  late TopRanking topRanked;
  bool istTopRankedGet = false;

  void getTopRanked() {
    emit(TopRankedLoadingState());
    DioHelper.getData(
      url: TOPRANKED,
      token: token,
    ).then((value) {
      topRanked = TopRanking.fromJson(value.data);
      emit(TopRankedGetSuccessState());
      istTopRankedGet = true;
    }).catchError((error) {
      istTopRankedGet = true;
      print("##ERRROR ${error.toString()}");

      emit(TopRankedGetErrorState(error.toString()));
    });
  }

  // Follow
  bool isFollowDone = true;

  void geFollowUser({
    required int userID,
  }) {
    isFollowDone = false;
    isUnFollowUserDone = false;
    emit(FollowLoadingState());
    DioHelper.postData(
      url:
          'users/${userID}/follow?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      print("DoneFollow Or Not");
      print(value.toString());
      isFollowDone = true;
      isUnFollowUserDone = true;
      emit(FollowSuccessState());
      getHomePosts();
      updatedUnFollowedUsers();
    }).catchError((error) {
      print(error.toString());
      emit(FollowErrorState(error.toString()));
      isFollowDone = true;
      isUnFollowUserDone = true;
    });
  }

  // UnFollow Method
  bool isUnFollowUserDone = true;

  void makeUnFollowProcess({
    required int userID,
  }) {
    isUnFollowUserDone = false;
    isFollowDone = false;
    emit(UnFollowLoading());
    DioHelper.deleteData(
      url:
          'users/${userID}/unfollow?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      print("## UnFollow Done");
      print(value.toString());
      isUnFollowUserDone = true;
      isFollowDone = true;
      emit(UnFollowSuccess());
      allposts.clear();
      getHomePosts();
      updatedUnFollowedUsers();
    }).catchError((error) {
      print("### ERROR");
      print(error.toString());
      emit(UnFollowError());
      isUnFollowUserDone = true;
      isFollowDone = true;
    });
  }

  // Get User Profile Page

  late UserProfile userProfile;
  late List<UserPosts> userPostsrevers;
  late int userid;

  bool isUserProfileDataGet = false;

  void getUserProfilePageData({
    required int userID,
    String? username,
  }) {
    userid = userID;
    isUserProfileDataGet = false;
    emit(UserProfileDataLoadingState());
    DioHelper.postData(
      url:
          'users/profile/${userID}?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      userPostsrevers = [];
      userProfile = UserProfile.fromJson(value.data);
      if (int.parse(userProfile.postCount) > 0)
        userProfile.posts!.forEach((element) {
          userPostsrevers.add(element);
        });
      userPostsrevers = userPostsrevers.reversed.toList();
      isUserProfileDataGet = true;
      emit(UserProfileDataSuccessState(
        username: username,
      ));
    }).catchError((error) {
      print(error.toString());
      emit(UserProfileDataErrorState(error.toString()));
      isUserProfileDataGet = true;
    });
  }

  // Get List of UnFollowed People

  bool isUnFollowedDataDone = true;
  late unFollowedProfiles othersIDs;
  late List<int> othersIDMenu;

  void getUnFollowedUsers({
    required int userID,
    String? username,
    String? image,
  }) {
    isUnFollowedDataDone = false;
    othersIDMenu = [];
    emit(GetFollowDataLoading());
    DioHelper.getData(
      url: 'users_can_follow?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      othersIDs = unFollowedProfiles.fromJson(value.data);
      othersIDs.users.forEach((element) {
        othersIDMenu.add(element.id);
      });
      emit(GetFollowDataSuccess());
      isUnFollowedDataDone = true;
    }).catchError((error) {
      print("##ERROR");
      print(error.toString());
      emit(GetFollowDataError());
      isUnFollowedDataDone = true;
    });
    getUserProfilePageData(
      userID: userID,
      username: username,
    );
  }

  // Update UnFollowed People

  void updatedUnFollowedUsers() {
    isUnFollowedDataDone = false;
    othersIDMenu = [];
    emit(GetFollowDataLoading());
    DioHelper.getData(
      url: 'users_can_follow?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      othersIDs = unFollowedProfiles.fromJson(value.data);
      othersIDs.users.forEach((element) {
        othersIDMenu.add(element.id);
      });
      emit(GetFollowDataSuccess());
      isUnFollowedDataDone = true;
    }).catchError((error) {
      print("##ERROR");
      print(error.toString());
      emit(GetFollowDataError());
      isUnFollowedDataDone = true;
    });
  }

  // pick Image Or Video

  ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? finalImage;

  Future<void> pickFile() async {
    emit(FilePickerLoading());
    image = await picker.pickImage(source: ImageSource.gallery).then((value) {
      image = value;
      finalImage = value;
      emit(FilePickerSuccessfully());
    }).onError((error, stackTrace) {
      emit(FilePickerError());
      print("### ERROR IMAGE");
      print(error.toString());
    });
  }

  // Add New Post

  late PostAdd postDataAdd;
  bool isPostAdded = false;

  Future<void> addNewPost({
    required String title,
    required XFile media,
    required int cat_id,
    required int state_id,
  }) async {
    File file = File(media.path);

    isPostAdded = false;
    emit(AddNewPostLoading());
    DioHelper.uploadImage(
      url: 'posts?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
      file: file,
      title: title,
      cat_id: cat_id,
      state_id: state_id,
    ).then((value) {
      postDataAdd = PostAdd.fromJson(value.data);
      isPostAdded = true;
      emit(AddNewPostSuccess());
      image = null;
      finalImage = null;
    }).catchError((error) {
      print(error.toString());
      emit(AddNewPostError(error.toString()));
      isPostAdded = true;
    });
  }

  String? selectedCatItem;
  String? selectedStateItem;

  void selectCatItemChange({required String item}) {
    selectedCatItem = item;
    emit(ChangeselectedCatItem());
  }

  void selectStateItemChange({required String item}) {
    selectedStateItem = item;
    emit(ChangeselectedStateItem());
  }

  late SearchModel postsSearched;
  int counter2 = 0;

  void chang() {
    counter2 = 0;
    emit(ChangeCounter2Value());
  }

  // D O      S e a r c h
  void getSearch({required String keyword}) {
    emit(getSearchLoading());
    DioHelper.postData(
      url:
          'posts/search/$keyword?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      counter2 = 1;
      postsSearched = SearchModel.fromJson(value.data);
      emit(getSearchSuccess());
    }).catchError((error) {
      counter2 = 1;
      print(error.toString());
      emit(getSearcherror());
    });
  }

  // Dark Mode
  bool darkMode = darkmode;
  void changeDarkMode({required bool darkmode2})
  {
    emit(DarkModeChangedLoading());
    darkmode = darkmode2;
    darkMode = darkmode2;
    emit(DarkModeChangedSuccess());
  }
}

/// S m a l l     M o d e l s ///

class PostAdd {
  late String message;

  PostAdd.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

class unFollowedProfiles {
  late List<OthersID> users = [];

  unFollowedProfiles.fromJson(Map<String, dynamic> json) {
    json['users'].forEach((v) {
      users.add(new OthersID.fromJson(v));
    });
  }
}

class OthersID {
  late int id;

  OthersID.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
