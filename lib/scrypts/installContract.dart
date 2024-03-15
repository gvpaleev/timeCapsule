import 'package:flutter_dotenv/flutter_dotenv.dart';

void main(List<String> args) async {
  print('start');

  await dotenv.load();
  // print(dotenv.get('RPC_URL_NODE'));
}
