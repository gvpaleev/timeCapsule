import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final String name;
  final String description;
  final String urlImg;
  final List<CommentEntity> comments;

  PersonEntity(
      {required this.name,
      required this.description,
      required this.urlImg,
      required this.comments});

  @override
  List<Object?> get props => [
        name,
        description,
        urlImg,
      ];
}

class CommentEntity {
  final String comment;

  CommentEntity({required this.comment});
}