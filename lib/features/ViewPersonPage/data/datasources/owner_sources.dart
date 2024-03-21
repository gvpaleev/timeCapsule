import 'package:shared_preferences/shared_preferences.dart';

abstract class OwnerDataSources {
  Future<String> getPrivateKey();
}

const USER_DB = 'USER_DB';

class OwnerDataSourcesImpl extends OwnerDataSources {
  final SharedPreferences sharedPreferences;

  OwnerDataSourcesImpl({required this.sharedPreferences});

  @override
  Future<String> getPrivateKey() async {
    final String privateKey = sharedPreferences.getString('privateKey') ??
        '34654e917a958da2cd01c3ee56397d2391ffdf0258b7c7fbdea6fbb955875a7b';
    return privateKey;
  }
}
