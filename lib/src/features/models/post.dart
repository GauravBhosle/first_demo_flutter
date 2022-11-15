// To parse this JSON data, do
//
//     final postTodo = postTodoFromJson(jsonString);

import 'dart:convert';

List<PostTodo> postTodoFromJson(String str) => List<PostTodo>.from(json.decode(str).map((x) => PostTodo.fromJson(x)));

String postTodoToJson(List<PostTodo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostTodo {
  PostTodo({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory PostTodo.fromJson(Map<String, dynamic> json) => PostTodo(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
