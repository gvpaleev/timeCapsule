import 'dart:math';

import 'package:TimeCapsule/shared/provider/Human.dart';
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
    _credentials = EthPrivateKey.createRandom(Random.secure());
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
        function: _contract.function('people'),
        params: [id]));
  }

  getComents(BigInt id) async {
    final comentsId = (await call(
            sender: _ownerAddress,
            contract: _contract,
            function: _contract.function('getComents'),
            params: [id]))
        .expand((element) => element)
        // .map((item) => BigInt.from(item))
        .toList();
    // .map((item) => BigInt.from(item))
    // .toList();
    List<Future<dynamic>> coments =
        comentsId.map((elem) => _getComent(elem)).toList();
    return Future.wait(coments);
  }

  Future<String> _getComent(BigInt id) async {
    return (await call(
        sender: _ownerAddress,
        contract: _contract,
        function: _contract.function('comments'),
        params: [id]))[1];
  }
}
