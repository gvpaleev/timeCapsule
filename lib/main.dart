import 'package:TimeCapsule/app/my_app.dart';
import 'package:TimeCapsule/features/ViewPersonPage/presentation/bloc/persons_bloc.dart';
import 'package:TimeCapsule/features/ViewPersonPage/presentation/pages/persons_view.dart';
import 'package:TimeCapsule/locator_service.dart';
import 'package:TimeCapsule/scrypts/installContract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await init();
  runApp(const MyApp());
  // await Hive.initFlutter();
  // runApp(const MyApp());

  // await installContractTimeContract();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<PersonListCubit>(
        //   create: (context) {
        //     return sl<PersonListCubit>()..loadPerson();
        //   },
        // ),
        BlocProvider<PersonsBloc>(
          create: (context) {
            return sl<PersonsBloc>();
            //..add(PersonsEvent.started());
          },
        ),
      ],
      child: MaterialApp(
        home: PersonViewScreen(),
      ),
    );
  }
}
