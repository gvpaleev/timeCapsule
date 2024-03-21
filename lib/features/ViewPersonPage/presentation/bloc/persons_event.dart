part of 'persons_bloc.dart';

@freezed
class PersonsEvent with _$PersonsEvent {
  const factory PersonsEvent.started() = _StartedEvent;
}
