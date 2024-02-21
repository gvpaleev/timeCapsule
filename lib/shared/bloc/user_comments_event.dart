part of 'user_comments_bloc.dart';

@immutable
sealed class UserCommentsEvent {}

final class UserComentsUpdate extends UserCommentsEvent {}
