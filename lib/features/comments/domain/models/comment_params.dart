class CommentParams {
  CommentParams({
    required this.id,
  });

  late final int id;

  CommentParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
