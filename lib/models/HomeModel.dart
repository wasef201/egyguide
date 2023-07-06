class HomePosts {
  List<PostsData> posts = [];

  HomePosts.fromJson(Map<String, dynamic> json) {
    json['posts'].forEach((v) {
      posts.add(new PostsData.fromJson(v));
    });
  }
}

class PostsData {
  late int id;
  late String userId;
  String? categoryId;
  String? countryId;
  String? stateId;
  String? title;
  String? avatar;
  List<Media>? media;
  User? user;
  late String createDate;

  PostsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    title = json['title'];
    avatar = json['avatar'];
    createDate = json['created_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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

class User {
  String? name;


  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }


}


