import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

installContractTimeContract() async {
  print('Start scrypt InstallContractTimeContract');
  await dotenv.load();

  late EthPrivateKey credentials = EthPrivateKey.fromHex(
      '34654e917a958da2cd01c3ee56397d2391ffdf0258b7c7fbdea6fbb955875a7c');
  final address = credentials.address;
  final Web3Client web3Client =
      Web3Client(dotenv.get('RPC_URL_NODE'), Client());
  EthereumAddress usdtContractAddress =
      EthereumAddress.fromHex(dotenv.get('USDT_CONTRACT_ADDRESS'));
  DeployedContract usdtContract = DeployedContract(
      ContractAbi.fromJson(dotenv.get('USDT_CONTRACT_ABI'), 'usdt'),
      usdtContractAddress);

  EthereumAddress capsuleContractAddress =
      EthereumAddress.fromHex(dotenv.get('CAPSULE_TIME_CONTRACT_ADDRESS'));
  DeployedContract capsuleContract = DeployedContract(
      ContractAbi.fromJson(dotenv.get('CAPSULE_TIME_CONTRACT_ABI'), 'capsule'),
      capsuleContractAddress);

  List<List<String>> HumanCapsule = [
    [
      'Joe Biden',
      '20/11/1942',
      'Joseph Robinette Biden Jr. is an American politician who is the 46th and current president of the United States. A member of the Democratic Party, he previously served as the 47th vice president from 2009 to 2017 under President Barack Obama and represented Delaware in the United States Senate from 1973 to 2009',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg'
    ],
    []
  ];

  print('Address wallet: $address');
  print('Balance BNB: ${await web3Client.getBalance(address)}');
  print(
      'Balance USDT: ${(await web3Client.call(sender: address, contract: usdtContract, function: usdtContract.function('balanceOf'), params: [
        address
      ]))[0]}');
}
