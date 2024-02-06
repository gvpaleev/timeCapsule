import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' show join, dirname;
import 'package:web_socket_channel/io.dart';
import 'package:web3dart/web3dart.dart';

class Comntract {
  late Web3Client _client;
  late EthPrivateKey _credentials;
  late EthereumAddress _address;
  late EthereumAddress _contractAddr;
  bool _installStatus = false;
  var _abiCode;
  var _contract;

  Comntract() {
    _client = Web3Client(dotenv.get('RPC_URL_NODE'), Client());
    _credentials = EthPrivateKey.fromHex(dotenv.get('WALLET_WEB3_PRIVATE_KEY'));
    _address = _credentials.address;
    _contractAddr =
        EthereumAddress.fromHex(dotenv.get('CONTRACT_TIME_CAPSULE'));

    _install();
  }

  Future _install() async {
    _abiCode = await rootBundle.loadString('lib/shared/config/abi.json');

    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, 'TimeCapsule'), _contractAddr);

    print(_contract);
    print(await _client.getBalance(_address));
    print(await _client.getBalance(_contractAddr));

    _installStatus = true;
  }
}
