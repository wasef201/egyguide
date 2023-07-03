import 'package:egyuide/models/LoginModel.dart';
import 'package:egyuide/models/RegisterModel.dart';


abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates{
  final String error;

  LoginErrorState(this.error);
}


class RegisterLoadingState extends LoginStates{

}
class RegisterSuccessState extends LoginStates{
  final Register registerModel;

  RegisterSuccessState(this.registerModel);

}
class RegisterErrorState extends LoginStates{
  final String error;

  RegisterErrorState(this.error);
}