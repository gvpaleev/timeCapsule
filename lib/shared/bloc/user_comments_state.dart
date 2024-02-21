part of 'user_comments_bloc.dart';

@immutable
sealed class UserCommentsState {
  final List<Map<DateTime, String>> comments;
  const UserCommentsState({required this.comments});
}

final class UserCommentsInitial extends UserCommentsState {
  UserCommentsInitial()
      : super(comments: [
          {
            DateTime.now(): 'comment one',
          },
          {
            DateTime.now(): 'comment two',
          },
          {
            DateTime.now(): 'comment three',
          },
          {
            DateTime.now(): 'comment three',
          },
          {
            DateTime.now(): 'comment three',
          },
          {
            DateTime.now(): 'comment three',
          },
          {
            DateTime.now(): 'comment three',
          },
        ]);
}

final class UserCommentsUpdateState extends UserCommentsState {
  const UserCommentsUpdateState({required super.comments});
}
