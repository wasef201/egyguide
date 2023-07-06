class SearchModel
{
  List<SearchPosts>? posts;

  SearchModel.fromJson(Map<String, dynamic> json)
  {
    if( json['posts'] != null) {
      posts = <SearchPosts>[];
      json['posts'].forEach((element) {
        posts!.add(SearchPosts.fromJson(element));
      });
    }
  }
}

class SearchPosts
{
  late int id;
  late String user_id;
  late String title;
  late String createdAt;
  late UserInfo user;
  late String avatar;
  List<Media> media = [];

  SearchPosts.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    user_id = json['user_id'];
    title = json['title'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    user = UserInfo.fromJson(json['user']);
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }

  }

}

class UserInfo
{
  late String name;

  UserInfo.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
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