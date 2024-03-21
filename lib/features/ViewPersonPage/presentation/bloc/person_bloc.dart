import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_event.dart';
part 'person_state.dart';
part 'person_bloc.freezed.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(_Initial()) {
    on<PersonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
