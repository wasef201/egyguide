class UserProfile
{
  List<UserPosts>? posts;
  late String postCount;
  late UserInformation bio;
  late int followers;
  late int following;

  UserProfile.fromJson(Map<String,dynamic> json)
  {
    if (json['posts'] != null || json['posts'] != [])
    json['posts'].forEach((v) {
      posts?.add(new UserPosts.fromJson(v));
    });
    postCount = json['post count'];
    bio = UserInformation.fromJson(json['bio']);
    followers = json['followers number'];
    following = json['following number'];
  }

}

class UserPosts
{
  late int postID;
  UserPosts.fromJson(Map<String,dynamic> json)
  {
    postID = json['id'];
  }
}

class UserInformation
{
  UserData? data;
  int? years;
  String? joinedAt;

  UserInformation.fromJson(Map<String, dynamic> json)
  {
    if (json['data'] != null)
        data = UserData.fromJson(json['data']);
    years = json['years'];
    joinedAt = json['Joined at'];

  }

}

class UserData
{
  String? job;
  String? dob;
  String? phone;
  String? email;
  String? country;

  UserData.fromJson(Map<String,dynamic> json)
  {
    job = json['job'];
    dob = json['dob'];
    phone = json['contact_number'];
    email = json['extra_email'];
    country = json['country'];
  }
}
