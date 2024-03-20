import 'package:TimeCapsule/features/ViewPersonPage/data/models/local_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserDataSources {
  Future<OwnerModel> getUser();
}

const USER_DB = 'USER_DB';

class UserDataSourcesImpl extends UserDataSources {
  final SharedPreferences sharedPreferences;

  UserDataSourcesImpl({required this.sharedPreferences});

  @override
  Future<OwnerModel> getUser() async {
    final String privateKey = sharedPreferences.getString('privateKey') ??
        (() {
          return 's';
        })();

    // final LocalUserModel localUserModel = LocalUserModel(
    //   // address: ,
    //   privateKey: privateKey,
    // );
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
