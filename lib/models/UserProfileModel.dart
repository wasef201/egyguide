class UserProfile
{
  List<UserPosts>? posts;
  late String postCount;
  late String avatar;
  late UserInformation bio;
  late int followers;
  late int following;

  UserProfile.fromJson(Map<String,dynamic> json)
  {
    if (json['posts'] != null || json['posts'] != []) {
      posts = <UserPosts>[];
      json['posts'].forEach((v) {
        posts!.add(new UserPosts.fromJson(v));
      });
    }
    postCount = json['post count'];
    avatar = json['User_Avatar'];
    bio = UserInformation.fromJson(json['bio']);
    followers = json['followers number'];
    following = json['following number'];
  }

}

class UserPosts
{
  late int postID;
  late String title;
  List<Media>? media;
  late String createDate;



  UserPosts.fromJson(Map<String,dynamic> json)
  {
    postID = json['id'];
    title = json['title'];
    createDate = json['created_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }

  }
}
class Media {
  String? originalUrl;
  String? fileType;

  Media.fromJson(Map<String, dynamic> json) {
    originalUrl = json['original_url'];
    fileType = json['mime_type'];
  }
}

class UserInformation
{
  UserData? data;
  dynamic? years;
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
