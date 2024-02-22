import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'person_card_event.dart';
part 'person_card_state.dart';

class PersonCardBloc extends Bloc<PersonCardEvent, PersonCardState> {
  PersonCardBloc() : super(PersonCardInitial()) {
    // on<PersonCardEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
