part of 'person_card_bloc.dart';

@immutable
sealed class PersonCardsState {
  final List<Person>? personsOriginal;
  List<Person>? personsSorted;
  Person? activePerson;
  String? message;
  PersonCardsState(
      {this.personsOriginal,
      this.activePerson,
      this.personsSorted,
      this.message});

  // static PersonCardsState copyWith(
  //     {required PersonCardsState personCardsState}) {
  //   return PersonCardsState(
  //     personsOriginal: personCardsState.personsOriginal,
  //     activePerson: personCardsState.activePerson,
  //     personsSorted: personCardsState.personsSorted,
  //   );
  // }
}

final class PersonCardsInitialState extends PersonCardsState {
  PersonCardsInitialState();
}

final class PersonCardsInstalledState extends PersonCardsState {
  PersonCardsInstalledState()
      : super(personsOriginal: [
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
              urlIcon:
                  'https://s13.stc.yc.kpcdn.net/share/i/12/13651300/wr-960.webp'),
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
              urlIcon:
                  'https://s13.stc.yc.kpcdn.net/share/i/12/13651300/wr-960.webp'),
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
              urlIcon:
                  'https://s13.stc.yc.kpcdn.net/share/i/12/13651300/wr-960.webp'),
        ]) {
    activePerson = personsOriginal?[Random().nextInt(personsOriginal!.length)];
    personsSorted = personsOriginal;
  }
}

final class PersonCardsUpdateState extends PersonCardsState {
  PersonCardsUpdateState(
      {super.personsOriginal,
      super.activePerson,
      super.personsSorted,
      super.message});
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
