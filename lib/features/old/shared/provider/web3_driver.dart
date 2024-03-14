import 'dart:math';
import 'package:TimeCapsule/features/old/shared/provider/Human.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Web3Driver extends Web3Client {
  late EthereumAddress _ownerAddress;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _credentials;
  late DeployedContract _contract;

  Web3Driver() : super(dotenv.get('RPC_URL_NODE'), Client()) {
    // _credentials = EthPrivateKey.createRandom(Random.secure());
    _credentials = EthPrivateKey.fromHex(
        '34654e917a958da2cd01c3ee56397d2391ffdf0258b7c7fbdea6fbb955875a7c');
    _ownerAddress = _credentials.address;
    _contractAddress = EthereumAddress.fromHex(dotenv.get('CONTRACT_ADDRESS'));
    _contract = DeployedContract(
        ContractAbi.fromJson(dotenv.get('CONTRACT_ABI'), 'TimeCapsule'),
        _contractAddress);
  }

  Future<BigInt> getHumanCount() async {
    return (await call(
        sender: _ownerAddress,
        contract: _contract,
        function: _contract.function('getHumanCount'),
        params: []))[0];
  }

  Future<Human> getHuman(BigInt id) async {
    return Human.fromList(await call(
        sender: _ownerAddress,
        contract: _contract,
        function: _contract.function('humans'),
        params: [id]));
  }

  Future<Iterable<String>> getComentsForHuman(BigInt id) async {
    final commentsCount = await call(
        sender: _ownerAddress,
        contract: _contract,
        function: _contract.function('getCommentsCount'),
        params: [id]);
    if (commentsCount[0] > BigInt.from(0)) {
      final comments = await call(
          sender: _ownerAddress,
          contract: _contract,
          function: _contract.function('getComentsForHuman'),
          params: [id]);
      return comments[0].map<String>((e) => e.toString());
    }
    return Iterable.empty();
  }

  Future<String> setHuman(String user, String desc, String url) async {
    String txn = await sendTransaction(
      _credentials,
      chainId: int.parse(dotenv.get('CHAIN_ID')),
      Transaction.callContract(
        contract: _contract,
        function: _contract.function('setHuman'),
        parameters: [user, desc, url],
      ),
    );
    return txn;
  }

  Future<String> setComment(BigInt id, String comment) async {
    String txn = await sendTransaction(
      _credentials,
      chainId: int.parse(dotenv.get('CHAIN_ID')),
      Transaction.callContract(
        contract: _contract,
        function: _contract.function('setComment'),
        parameters: [id, comment],
      ),
    );
    return txn;
  }
}
