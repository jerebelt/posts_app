import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  CommentModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) =>
      CommentModel(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };

  @override
  List<Object?> get props => [
        postId,
        id,
        name,
        email,
        body,
      ];
}
