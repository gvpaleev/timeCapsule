part of 'persons_bloc.dart';

@freezed
class PersonsState with _$PersonsState {
  const factory PersonsState.initial() = _Initial;
  const factory PersonsState.loading() = _Loading;
  const factory PersonsState.loaded({required Iterable<PersonEntity> persons}) =
      _Loaded;
  const factory PersonsState.error() = _Error;
}
