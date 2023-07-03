abstract class AppStates{}

class AppInitialState extends AppStates{}


class HomePostsLoadingState extends AppStates {}

class HomePostsGetSuccessState extends AppStates {}

class HomePostsGetErrorState extends AppStates {
  final String error;

  HomePostsGetErrorState(this.error);
}


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

class UserProfileDataLoadingState extends AppStates {}
class UserProfileDataSuccessState extends AppStates {}
class UserProfileDataErrorState extends AppStates {
  final String error;

  UserProfileDataErrorState(this.error);
}

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

// T  E S T
class FollowLoading extends AppStates {}
class FollowSuccess extends AppStates {}



