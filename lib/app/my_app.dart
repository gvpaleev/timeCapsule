import 'package:TimeCapsule/features/person_card_bloc.dart';
import 'package:TimeCapsule/features/user_date_bloc.dart';
import 'package:TimeCapsule/pages/find_person_screen.dart';
import 'package:TimeCapsule/pages/person_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              background: Color.fromARGB(255, 246, 246, 246)),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => UserDateBloc(),
                  ),
                  BlocProvider(
                    create: (context) => PersonCardsBloc(),
                  ),
                ],
                child: PersonCardScreen(),
              ),
          '/findPerson': (ctx) => BlocProvider(
                create: (context) => PersonCardsBloc(),
                child: FindPersonScreen(),
              )
        });
  }
}
