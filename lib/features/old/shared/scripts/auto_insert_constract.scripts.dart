import 'dart:math';

import 'package:TimeCapsule/features/old/shared/provider/web3_driver.dart';
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
    // print(await web3driver.getHuman(BigInt.from(0)));
    // print(await web3driver.getComentsForHuman(BigInt.from(1)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(await web3driver.setHuman(generateRandomString(10),
        generateRandomString(10), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(1), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(1), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(1), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(2), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(2), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(2), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(2), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(3), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(3), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(3), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(4), generateRandomString(10)));
    print(
        await web3driver.setComment(BigInt.from(4), generateRandomString(10)));
  }

  String generateRandomString(int length) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(
        length, (index) => charset[random.nextInt(charset.length)]).join();
  }
}
