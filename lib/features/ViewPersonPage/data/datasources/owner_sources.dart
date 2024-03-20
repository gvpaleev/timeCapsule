import 'package:TimeCapsule/features/ViewPersonPage/data/models/owner_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

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
        '34654e917a958da2cd01c3ee56397d2391ffdf0258b7c7fbdea6fbb955875a7b';

    late EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    final Web3Client web3Client =
        Web3Client(dotenv.get('RPC_URL_NODE'), Client());

    EthereumAddress usdtContractAddress =
        EthereumAddress.fromHex(dotenv.get('USDT_CONTRACT_ADDRESS'));
    DeployedContract usdtContract = DeployedContract(
        ContractAbi.fromJson(dotenv.get('USDT_CONTRACT_ABI'), 'usdt'),
        usdtContractAddress);

    // EthereumAddress capsuleContractAddress =
    //     EthereumAddress.fromHex(dotenv.get('CAPSULE_TIME_CONTRACT_ADDRESS'));

    // final LocalUserModel localUserModel = LocalUserModel(
    //   // address: ,
    //   privateKey: privateKey,
    // );
    // TODO: implement getUser
    return OwnerModel(
      privateKey: privateKey,
      address: address.toString(),
      balanceBNB: await web3Client.getBalance(address).toString(),
      balanceUSDT:
          '${(await web3Client.call(sender: address, contract: usdtContract, function: usdtContract.function('balanceOf'), params: [
            address
          ]))[0]}',
    );
  }
}
