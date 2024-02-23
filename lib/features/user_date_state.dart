part of 'user_date_bloc.dart';

enum UserDataStatus { initial, loading, loaded, error }

// @freezed
class UserDataState {
  final UserDataStatus status;
  final String? privateKey;
  final EthereumAddress? ownerAddress;
  final EthereumAddress? contractAddress;
  final EthPrivateKey? credentials;
  final DeployedContract? contract;

  // static UserDataState initial() =>
  //     UserDataState(status: UserDataStatus.initial);

  const UserDataState(
      {required this.status,
      this.privateKey,
      this.ownerAddress,
      this.contractAddress,
      this.credentials,
      this.contract});
}

class UserDateInitialState extends UserDataState {
  UserDateInitialState() : super(status: UserDataStatus.initial);
}

// final class UserDateInstalledState extends UserDateState {
//   UserDateInstalledState() {
//     // _install();
//   }
//   _install() async {
//     _privateKey = await _getPrivateKey();
//     _credentials = EthPrivateKey.fromHex(_privateKey!);
//     // ownerAddress = _credentials?.address;
//     _contractAddress =
//         EthereumAddress.fromHex(dotenv.get('CAPSULE_TIME_CONTRACT_ADDRESS'));
//     _contract = DeployedContract(
//         ContractAbi.fromJson(
//             dotenv.get('CAPSULE_TIME_CONTRACT_ABI'), 'TimeCapsule'),
//         _contractAddress!);
//   }
// }

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



