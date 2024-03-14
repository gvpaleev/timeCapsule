part of 'user_date_bloc.dart';

@immutable
sealed class UserDateEvent {}

final class UserDateUpdateEvent extends UserDateEvent {}
