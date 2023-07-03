class LoginModel
{


  UserData? data;
  late String accessToken;

  LoginModel.fromJson(Map<String, dynamic> json)
  {
    data = json['user'] !=null ? UserData.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

}
class UserData
{
  late String name;
  late String email;
  late int userID;

  //named Constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    userID = json['id'];
  }


}
