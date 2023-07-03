
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/models/HomeModel.dart';
import 'package:egyuide/models/TopRankedModel.dart';
import 'package:egyuide/models/UserProfileModel.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:egyuide/utilities/dio_helper.dart';
import 'package:egyuide/utilities/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // BottomNavigationBar
  int currentIndex = 1;
  void changeIndex({required int index})
  {
    currentIndex = index;
  }




  // Home Posts
  late HomePosts homePOsts;
  bool isHomeGet = false;
  void getHomePosts() {
    emit(HomePostsLoadingState());

    DioHelper.getData(
      url: POSTS,
      token: token,
    ).then((value) {
      homePOsts = HomePosts.fromJson(value.data);
      isHomeGet = true;
      emit(HomePostsGetSuccessState());
    }).catchError((error) {
      isHomeGet = true;
      print("##ERRROR ${error.toString()}");

      emit(HomePostsGetErrorState(error.toString()));
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
      istTopRankedGet = true;
      emit(TopRankedGetSuccessState());
    }).catchError((error) {
      istTopRankedGet = true;
      print("##ERRROR ${error.toString()}");

      emit(TopRankedGetErrorState(error.toString()));
    });
  }

  late FollowModel followModel;
  // Follow
  bool isFollowDone = true;

  void testFollowButton()
  {
    emit(FollowLoading());
    isFollowDone = !isFollowDone;
    emit(FollowSuccess());
  }

  void geFollowUser({
    required int userID,
  }) {
    isFollowDone = false;
    emit(FollowLoadingState());
    DioHelper.postData(
      url: 'users/${userID}/follow?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      followModel = FollowModel.fromJson(value.data);
      isFollowDone = true;
      emit(FollowSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(FollowErrorState(error.toString()));
      isFollowDone = true;
    });
  }


  // Get User Profile Page

  late UserProfile userProfile;
  bool isUserProfileDataGet = false;

  void getUserProfilePageData({
    required int userID,
  }) {
    isUserProfileDataGet = false;
    emit(UserProfileDataLoadingState());
    DioHelper.postData(
      url: 'users/profile/${userID}?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
    ).then((value) {
      print(value.data.toString());
      userProfile = UserProfile.fromJson(value.data);
      print("### UserProfileData");
      isUserProfileDataGet = true;
      emit(UserProfileDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(UserProfileDataErrorState(error.toString()));
      isUserProfileDataGet = true;
    });
  }


  // pick Image Or Video

  ImagePicker picker = ImagePicker();
  XFile? image;
  XFile?finalImage;

  Future<void> pickFile()
  async {
    emit(FilePickerLoading());
    image = await picker.pickImage(source: ImageSource.gallery).then((value)
    {
      image = value;
      finalImage = value;
      emit(FilePickerSuccessfully());
    }).onError((error, stackTrace)
    {
      emit(FilePickerError());
      print("### ERROR IMAGE");
      print(error.toString());
    }
    );
  }

  // Add New Post

  late PostAdd postDataAdd;
  bool isPostAdded = false;

  void addNewPost(
  {
    required String title,
    required XFile media,

}) {
    isPostAdded = false;
    emit(AddNewPostLoading());
    DioHelper.postData(
      url: 'posts?api_password=pr%261i8y%fRL8%269P*AvEm%xnL\$pobQ3',
      token: token,
      query:
      {
        'title':title,
        'description' : 'description',
        'media' : media,
        'category_id' : 1,
        'country_id' : 63,
        'state_id' : 2,
      }
    ).then((value) {
      print(value.data.toString());
      // postDataAdd = PostAdd.fromJson(value.data);
      print("### NewPostMessage");
      isPostAdded = true;
      emit(AddNewPostSuccess());
    }).catchError((error){
      print(error.toString());
      emit(AddNewPostError(error.toString()));
      isPostAdded = true;
    });
  }




}


class FollowModel
{
  late String follow;

  FollowModel.fromJson(Map<String, dynamic> json) {
    follow = json['followed'];
  }
}

class PostAdd
{
  late String message;

  PostAdd.fromJson(Map<String, dynamic> json)
  {
    message = json['message'];
  }
}