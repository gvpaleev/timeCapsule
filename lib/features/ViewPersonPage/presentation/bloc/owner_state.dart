part of 'owner_bloc.dart';

@freezed
class OwnerState with _$OwnerState {
  const factory OwnerState.initial() = _Initial;
  const factory OwnerState.loading() = _Loading;
  const factory OwnerState.loaded({required OwnerEntity ownerEntity}) = _Loaded;
  const factory OwnerState.error() = _Error;
}
