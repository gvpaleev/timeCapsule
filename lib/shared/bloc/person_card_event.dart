part of 'person_card_bloc.dart';

@immutable
sealed class PersonCardsEvent {}

class PersonCardsFindEvent extends PersonCardsEvent {
  final String searchElement;
  PersonCardsFindEvent({required this.searchElement});
}

class UpdateSendingMessagesEvent extends PersonCardsEvent {
  final String message;
  UpdateSendingMessagesEvent({required this.message});
}
