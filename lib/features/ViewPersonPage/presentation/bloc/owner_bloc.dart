import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/owner_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/usecases/get_owner.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_event.dart';
part 'owner_state.dart';
part 'owner_bloc.freezed.dart';

class OwnerBloc extends Bloc<OwnerEvent, OwnerState> {
  final GetOwner getOwner;
  OwnerBloc({required this.getOwner}) : super(_Initial()) {
    on<_Started>((event, emit) async {
      emit(_Loading());
      emit(_Loaded(ownerEntity: await getOwner()));
    });
  }
}
