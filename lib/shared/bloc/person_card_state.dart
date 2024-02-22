part of 'person_card_bloc.dart';

@immutable
sealed class PersonCardState {
  final String name;
  final String description;
  final String urlIcon;
  final List<Map<DateTime, String>> comments;
  const PersonCardState(
      {required this.name,
      required this.description,
      required this.urlIcon,
      required this.comments});
}

final class PersonCardInitial extends PersonCardState {
  PersonCardInitial({
    super.name = 'Loading...',
    super.description = 'Loading...;Loading...',
    super.urlIcon = 'Loading...',
  }) : super(comments: [
          {
            DateTime.now(): 'comment one',
          },
          {
            DateTime.now(): 'comment two',
          },
          {
            DateTime.now(): 'comment three',
          },
        ]);
}
