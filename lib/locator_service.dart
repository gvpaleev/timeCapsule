import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/owner_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/web3_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/data/repositories/owner_repository_impl.dart';
import 'package:TimeCapsule/features/ViewPersonPage/data/repositories/person_repository_impl.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/owner_repository.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/person_repository.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/usecases/get_owner.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/usecases/get_persons.dart';
import 'package:TimeCapsule/features/ViewPersonPage/presentation/bloc/owner_bloc.dart';
import 'package:TimeCapsule/features/ViewPersonPage/presentation/bloc/persons_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory<PersonsBloc>(() {
    print('object');

    return PersonsBloc(getPersons: sl());
  });

  sl.registerFactory<OwnerBloc>(() {
    print('object');

    return OwnerBloc(getOwner: sl());
  });
  // UseCases
  sl.registerLazySingleton(() {
    print('object');

    return GetPersons(sl());
  });
  sl.registerLazySingleton(() {
    print('object');

    return GetOwner(sl());
  });
  // Repository
  sl.registerLazySingleton<PersonRepository>(() {
    print('object');

    return PersonRepositoryImpl(web3dataSource: sl());
  });
  sl.registerLazySingleton<OwnerRepository>(() {
    return OwnerRepositoryImpl(web3dataSource: sl());
  });

  sl.registerLazySingleton<Web3DataSource>(() {
    print('object');

    return Web3DataSourceImpl(
      privateKeyString:
          '34654e917a958da2cd01c3ee56397d2391ffdf0258b7c7fbdea6fbb955875a7c', //await sl<OwnerDataSources>().getPrivateKey(),
      usdtContractAddressString: dotenv.get('USDT_CONTRACT_ADDRESS'),
      abiUsdtContractString: dotenv.get('USDT_CONTRACT_ABI'),
      bnbContractAddressString: dotenv.get('CAPSULE_TIME_CONTRACT_ADDRESS'),
      abiBnbContractString: dotenv.get('CAPSULE_TIME_CONTRACT_ABI'),
    );
  });

  // Core

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async {
    return sharedPreferences;
  });
}
