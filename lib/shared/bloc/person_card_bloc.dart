import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'person_card_event.dart';
part 'person_card_state.dart';

class PersonCardBloc extends Bloc<PersonCardEvent, PersonCardsState> {
  PersonCardBloc() : super(PersonCardsInitialState()) {
    // on<PersonCardEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    emit(PersonCardsInstalledState());
  }
}
