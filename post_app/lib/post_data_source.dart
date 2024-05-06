import 'base_network.dart';
import 'post_model.dart';
import 'users_model.dart';
import 'comments_model.dart';

class PostDataSource {
  static PostDataSource instance = PostDataSource();

  Future<List<PostModel>> loadPosts() async {
    final List<dynamic> postsData = await BaseNetwork.get("posts");
    final List<UsersModel> usersData = await loadUsers(); 
    List<PostModel> posts = postsData.map((json) {
      var post = PostModel.fromJson(json);
      post.user = usersData.firstWhere((user) => user.id == post.userId);
      return post;
    }).toList();
    return posts;
  }

  Future<List<UsersModel>> loadUsers() async {
    final List<dynamic> usersData = await BaseNetwork.get("users");
    List<UsersModel> users = usersData.map((json) => UsersModel.fromJson(json)).toList();
    return users;
  }

    Future<List<CommentsModel>> loadComments(int postId) async {
    final List<dynamic> commentsData = await BaseNetwork.get("posts/$postId/comments");
    List<CommentsModel> comments = commentsData.map((json) => CommentsModel.fromJson(json)).toList();
    return comments;
  }
}

