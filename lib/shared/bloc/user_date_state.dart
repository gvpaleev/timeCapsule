part of 'user_date_bloc.dart';

@immutable
sealed class UserDateState {
  String? _privateKey;
  EthereumAddress? _ownerAddress;
  EthereumAddress? _contractAddress;
  EthPrivateKey? _credentials;
  DeployedContract? _contract;

  UserDateState();
}

final class UserDateInitialState extends UserDateState {
  UserDateInitialState();
}

final class UserDateInstalledState extends UserDateState {
  UserDateInstalledState() {
    _install();
  }
  _install() async {
    _privateKey = await _getPrivateKey();
    _credentials = EthPrivateKey.fromHex(_privateKey!);
    _ownerAddress = _credentials?.address;
    _contractAddress = EthereumAddress.fromHex(dotenv.get('CONTRACT_ADDRESS'));
    _contract = DeployedContract(
        ContractAbi.fromJson(dotenv.get('CONTRACT_ABI'), 'TimeCapsule'),
        _contractAddress!);
  }
}

Future<String> _getPrivateKey() async {
  // await Hive.deleteBoxFromDisk(dotenv.get('DB_NAME_HIVE'));
  Box box = await Hive.openBox<String>(dotenv.get('DB_NAME_HIVE'));
  box.get('privatKey') == null
      ? box.put('privatKey', generateRandomBigInt())
      : null;
  return box.get('privatKey');
}

String generateRandomBigInt() {
  List<String> bytes = List.generate(
      (64 / 8).ceil(), (index) => Random().nextInt(256).toRadixString(16));

  return bytes.join("");
}

// class Example {
//   late String data;
//   Example() {
//     data = await getString();
//   }
// }



