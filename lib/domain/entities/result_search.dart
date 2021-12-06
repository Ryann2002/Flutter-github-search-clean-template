import 'package:equatable/equatable.dart';

class ResultSearch extends Equatable {
  final String? title;
  final String? content;
  final String? img;

  const ResultSearch({
    this.title,
    this.img,
    this.content,
  });

  @override
  List<Object?> get props => [title, content, img];
}
