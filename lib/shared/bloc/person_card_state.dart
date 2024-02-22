part of 'person_card_bloc.dart';

@immutable
sealed class PersonCardsState {
  final List<Person>? persons;
  Person? activePerson;
  PersonCardsState({this.persons, this.activePerson});
}

final class PersonCardsInitialState extends PersonCardsState {
  PersonCardsInitialState();
}

final class PersonCardsInstalledState extends PersonCardsState {
  PersonCardsInstalledState()
      : super(persons: [
          Person(
              name: 'Loading.',
              description: 'Loading.;Loading.',
              comments: [
                {
                  DateTime.now(): 'comment one',
                },
                {
                  DateTime.now(): 'comment two',
                },
                {
                  DateTime.now(): 'comment three',
                }
              ],
              urlIcon: 'Loading.'),
          Person(
              name: 'Loading..',
              description: 'Loading..;Loading..',
              comments: [
                {
                  DateTime.now(): 'comment one',
                },
                {
                  DateTime.now(): 'comment two',
                },
                {
                  DateTime.now(): 'comment three',
                }
              ],
              urlIcon: 'Loading..'),
          Person(
              name: 'Loading...',
              description: 'Loading...;Loading...',
              comments: [
                {
                  DateTime.now(): 'comment one',
                },
                {
                  DateTime.now(): 'comment two',
                },
                {
                  DateTime.now(): 'comment three',
                }
              ],
              urlIcon: 'Loading...'),
        ]) {
    activePerson = persons?[Random().nextInt(persons!.length)];
  }
}

class Person {
  final String name;
  final String description;
  final String urlIcon;
  final List<Map<DateTime, String>> comments;
  Person({
    required this.name,
    required this.description,
    required this.urlIcon,
    required this.comments,
  });
}
