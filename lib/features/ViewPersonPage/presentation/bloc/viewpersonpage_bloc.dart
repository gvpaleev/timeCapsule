import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'viewpersonpage_event.dart';
part 'viewpersonpage_state.dart';

class ViewpersonpageBloc extends Bloc<ViewpersonpageEvent, ViewpersonpageState> {
  ViewpersonpageBloc() : super(ViewpersonpageInitial()) {
    on<ViewpersonpageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
