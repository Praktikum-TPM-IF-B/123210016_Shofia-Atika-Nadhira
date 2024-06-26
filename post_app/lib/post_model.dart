import 'users_model.dart';

class PostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  UsersModel? user; 

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.user,
  });

  PostModel.fromJson(Map<String, dynamic> json)
    : userId = json['userId'] as int?,
      id = json['id'] as int?,
      title = json['title'] as String?,
      body = json['body'] as String?,
      user = null;

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };
}