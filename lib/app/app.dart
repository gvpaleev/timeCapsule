import 'package:flutter/material.dart';

import 'package:time_capsule/pages/my_home_page.dart';

import '../pages/main_page.dart';

class app extends StatelessWidget {
  const app({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const MainPage(),
    );
  }
}
