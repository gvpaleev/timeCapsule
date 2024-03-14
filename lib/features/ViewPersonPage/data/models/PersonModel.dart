import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required super.name,
    required super.description,
    required super.urlImg,
    required super.comments,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      description: json['description'],
      urlImg: json['urlImg'],
      comments: json['comments'] != null
          ? (json['comments'] as List<dynamic>)
              .map((e) => CommentModel.fromJson(e))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'urlImg': urlImg,
    };
  }
}

class CommentModel extends CommentEntity {
  const CommentModel({required super.comment});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(comment: json['comment']);
  }

  Map<String, dynamic> toJson() {
    return {'comment': comment};
  }
}
