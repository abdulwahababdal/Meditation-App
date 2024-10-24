// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()

class Tip {
  int? id;
  String text;
  String author;
  List upvotes = [];
  List downvotes = [];

  Tip({this.id, required this.text, required this.author});

  bool upVoted(int userId) => upvotes.contains(id);
  bool downVoted(String author) => downvotes.contains(author);
  // factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
  // Map<String, dynamic> toJson() => _$TipToJson(this);

  Tip.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        text = json['text'] as String,
        author = json['author'] as String,
        upvotes = json['upvotes'] as List,
        downvotes = json['downvotes'] as List;
}
