
class Register {
  late String accessToken;
  Data? data;


  Register.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    data = json['user'] != null ? Data.fromJson(json['user']) : null;
  }
}

class Data {
  late String email;
  late String name;
  late int userID;


  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    userID = json['id'];

  }

}
