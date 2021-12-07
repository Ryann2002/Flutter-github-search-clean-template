import 'dart:convert';
import 'package:flutter_git_search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  ResultSearchModel({String? title, String? content, String? img})
      : super(title: title, content: content, img: img);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['login'] ?? "",
      content: map['id'].toString(),
      img: map['avatar_url'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
