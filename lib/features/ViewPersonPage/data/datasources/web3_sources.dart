import 'package:web3dart/web3dart.dart';

abstract class Web3DataSource {
  final EthPrivateKey credentials;

  final DeployedContract usdtContract;
  final DeployedContract capsuleContract;

  Web3DataSource({
    required this.credentials,
    required this.usdtContract,
    required this.capsuleContract,
  });

  Future<String> getAddresOwner();
  Future<String> getBalanceBnb();
  Future<String> getBalanceUsdt();
}

class Web3DataSourceImpl extends Web3DataSource {
  Web3DataSourceImpl({
    required String privateKeyString,
    required String usdtContractAddressString,
    required String abiUsdtContractAddressString,
    required String bnbContractAddressString,
    required String abiBnbContractAddressString,
  }) : super(
            credentials: EthPrivateKey.fromHex(privateKeyString),
            usdtContract: DeployedContract(
                ContractAbi.fromJson(abiUsdtContractAddressString, 'usdt'),
                EthereumAddress.fromHex(usdtContractAddressString)),
            capsuleContract: DeployedContract(
                ContractAbi.fromJson(abiBnbContractAddressString, 'capsule'),
                EthereumAddress.fromHex(bnbContractAddressString)));

  @override
  Future<String> getBalanceBnb() async {
    return '0.0';
  }

  @override
  Future<String> getBalanceUsdt() async {
    return '0.0';
  }

  @override
  Future<String> getAddresOwner() async {
    return 'addres';
  }
}
