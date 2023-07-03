import 'package:egyuide/models/LoginModel.dart';
import 'package:egyuide/models/RegisterModel.dart';
import 'package:egyuide/modules/user/cubit/states.dart';
import 'package:egyuide/utilities/dio_helper.dart';
import 'package:egyuide/utilities/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;

  void getLoginData({
    required String email,
    required String password,
}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(value);

      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }

  late Register registerInfo;

  void registerUser(context,{
    required String username,
    required String email,
    required String password,

  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, data:
    {
      'name' : username,
      'email' : email,
      'password' : password,
      'password_confirmation' : password,
    }).then((value) {
      registerInfo = Register.fromJson(value.data);
      emit(RegisterSuccessState(registerInfo));
    }).catchError((error)
    {
      // showMessage(message: error.toString(), state: ToastStates.error);
      emit(RegisterErrorState(error));
    });
  }

}
