import 'package:TimeCapsule/shared/provider/web3_driver.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class ScriptOne {
  late Web3Driver web3driver;
  ScriptOne({required this.web3driver}) {
    _install();
  }
  Future<void> _install() async {
    // print(await web3driver.getHumanCount());
    // print(await web3driver.getHuman(BigInt.from(2)));
    print(await web3driver.getComents(BigInt.from(0)));
  }
}
