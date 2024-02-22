// import 'dart:html';
// import 'dart:math';
// import 'package:http/http.dart';
import 'dart:math';
import 'package:TimeCapsule/shared/provider/Human.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:web3dart/web3dart.dart';

part 'user_date_event.dart';
part 'user_date_state.dart';

class UserDateBloc extends Bloc<UserDateEvent, UserDateState> {
  UserDateBloc() : super(UserDateInitialState()) {
    on<UserDateUpdateEvent>(_update);
  }
  _update(event, emit) async {
    // emit(const UserDateUpdateState(
    //     name: 'nameUpdate',
    //     description: 'descriptionUpdate',
    //     urlIcon: 'urlIconUpdate'));
  }

  String _getPrivateKey() {
    return 'ss';
  }
}
