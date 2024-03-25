import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/usecases/get_persons.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'persons_event.dart';
part 'persons_state.dart';
part 'persons_bloc.freezed.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final GetPersons getPersons;
  PersonsBloc({required this.getPersons}) : super(_Initial()) {
    on<_Started>((event, emit) async {
      emit(_Loading());
      emit(_Loaded(persons: await getPersons()));
    });
  }
}
