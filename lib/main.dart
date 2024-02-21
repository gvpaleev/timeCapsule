import 'package:TimeCapsule/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future main() async {
  await Hive.initFlutter();
  await dotenv.load();
  runApp(const MyApp());
}
