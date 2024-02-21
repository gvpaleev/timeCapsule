part of 'user_date_bloc.dart';

@immutable
sealed class UserDateState {
  final String name;
  final String description;
  final String urlIcon;
  const UserDateState(
      {required this.name, required this.description, required this.urlIcon});
}

final class UserDateInitial extends UserDateState {
  const UserDateInitial(
      {super.name = 'Loading...',
      super.description = 'Loading...;Loading...',
      super.urlIcon = 'Loading...'});
}

final class UserDateUpdateState extends UserDateState {
  const UserDateUpdateState(
      {required super.name,
      required super.description,
      required super.urlIcon});
}

// (
//       {super.name = 'Barack Obama',
//       super.description =
//           '28/Female;Emmelie is a traditional book-worm and has always been from a young age. She is a housekeeper mom with two kids and she has a lot of time to read and relax. \n Emmelie tends to casually browse books in a bookstore but she usually has a hard time finding the right one and spends a lot of time browsing.',
//       super.urlIcon =
//           'https://variety.com/wp-content/uploads/2022/12/MCDAVTH_WD058.jpg?w=1000&h=563&crop=1'});
