import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final String name;
  final String description;
  final String imgUrl;
  final Iterable<CommentEntity>? comments;

  const PersonEntity(
      {required this.name,
      required this.description,
      required this.imgUrl,
      required this.comments});

  @override
  List<Object?> get props => [
        name,
        description,
        imgUrl,
      ];
}

class CommentEntity {
  final String comment;

  const CommentEntity({required this.comment});
}
