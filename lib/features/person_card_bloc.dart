import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'person_card_event.dart';
part 'person_card_state.dart';

class PersonCardsBloc extends Bloc<PersonCardsEvent, PersonCardsState> {
  PersonCardsBloc() : super(PersonCardsInitialState()) {
    // on<PersonCardEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    emit(PersonCardsInstalledState());
    on<PersonCardsFindEvent>(_findPersons);
    on<UpdateSendingMessagesEvent>(_updateMessage);
  }
  _findPersons(PersonCardsFindEvent event, emit) {
    List<Person>? personsSorted = (state.personsOriginal ?? [])
        .where((element) => element.name
            .toLowerCase()
            .contains(event.searchElement.toLowerCase()))
        .toList();
    emit(PersonCardsUpdateState(
        personsOriginal: state.personsOriginal,
        personsSorted: personsSorted,
        activePerson: state.activePerson,
        message: state.message));
  }

  _updateMessage(UpdateSendingMessagesEvent event, emit) {
    emit(PersonCardsUpdateState(
        personsOriginal: state.personsOriginal,
        personsSorted: state.personsSorted,
        activePerson: state.activePerson,
        message: event.message));
  }
}
