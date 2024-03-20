import 'package:TimeCapsule/features/ViewPersonPage/data/models/owner_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OwnerDataSources {
  Future<OwnerModel> getUser();
}

const USER_DB = 'USER_DB';

class OwnerDataSourcesImpl extends OwnerDataSources {
  final SharedPreferences sharedPreferences;

  OwnerDataSourcesImpl({required this.sharedPreferences});

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
    return OwnerModel(privateKey: privateKey);
  }
}
