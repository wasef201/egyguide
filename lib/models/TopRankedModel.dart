class TopRanking {
  List<PostsData> data = [];


  TopRanking.fromJson(Map<String, dynamic> json) {
      json['users'].forEach((v) {
        data.add(new PostsData.fromJson(v));
    }
      );

  }

}

class PostsData {
  late int userId;
  late String name;
  late String postsCount;
  late String image;
  late List<dynamic> media;


  PostsData.fromJson(Map<String, dynamic> json) {
    userId = json['id'];
    name = json['name'];
    postsCount = json['posts_count'];
    image = json['avatar'];
    media = json['media'];
  }

}