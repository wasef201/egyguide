import 'package:egyuide/models/HomeModel.dart';
import 'package:egyuide/models/UserProfileModel.dart';

abstract class AppStates{}

class AppInitialState extends AppStates{}

class LoadingShowButton extends AppStates{}
class SuccessShowButton extends AppStates{}

class HomePostsLoadingState extends AppStates {}
class HomePostsGetSuccessState extends AppStates {}
class HomePostsGetErrorState extends AppStates {
  final String error;

  HomePostsGetErrorState(this.error);
}

class FollowButtonLoading extends AppStates {}
class FollowButtonSuccess extends AppStates {}
class FollowButtonError extends AppStates {}




class TopRankedLoadingState extends AppStates {}

class TopRankedGetSuccessState extends AppStates {}

class TopRankedGetErrorState extends AppStates {
  final String error;

  TopRankedGetErrorState(this.error);
}



class FollowLoadingState extends AppStates {}
class FollowSuccessState extends AppStates {}
class FollowErrorState extends AppStates {
  final String error;

  FollowErrorState(this.error);
}

class UnFollowLoading extends AppStates {}
class UnFollowSuccess extends AppStates {}
class UnFollowError extends AppStates {}




class UserProfileDataLoadingState extends AppStates {}
class UserProfileDataSuccessState extends AppStates
{
  String? username;
  UserProfileDataSuccessState({this.username});
}
class UserProfileDataErrorState extends AppStates {
  final String error;

  UserProfileDataErrorState(this.error);
}



class GetFollowDataLoading extends AppStates {}
class GetFollowDataSuccess extends AppStates {}
class GetFollowDataError extends AppStates {}

// F I L E p I C K E R
class FilePickerLoading extends AppStates {}
class FilePickerSuccessfully extends AppStates {}
class FilePickerError extends AppStates {}


// A  d d   N e w   P o s t

class AddNewPostLoading extends AppStates {}
class AddNewPostSuccess extends AppStates {}
class AddNewPostError extends AppStates {
  final String error;

  AddNewPostError(this.error);
}

class ChangeselectedCatItem extends AppStates{}
class ChangeselectedStateItem extends AppStates{}

// T  E S T
class FollowLoading extends AppStates {}
class FollowSuccess extends AppStates {}

// S E R C H
class getSearchLoading extends AppStates{}
class getSearchSuccess extends AppStates{}
class getSearcherror extends AppStates{}


class ChangeCounter2Value extends AppStates{}



