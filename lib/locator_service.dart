import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/owner_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/web3_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/data/repositories/person_repository_impl.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/person_repository.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/usecases/get_owner.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/usecases/get_persons.dart';
import 'package:TimeCapsule/features/ViewPersonPage/presentation/bloc/persons_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(() => PersonsBloc(getPersons: sl()));
  // UseCases
  sl.registerLazySingletonAsync(() async {
    return GetPersons(sl());
  });
  sl.registerLazySingletonAsync(() async {
    return GetOwner(sl());
  });
  // Repository
  sl.registerLazySingletonAsync<PersonRepository>(() async {
    return PersonRepositoryImpl(web3dataSource: sl());
  });

  sl.registerLazySingletonAsync<Web3DataSource>(() async {
    return Web3DataSourceImpl(
      privateKeyString: await sl<OwnerDataSources>().getPrivateKey(),
      usdtContractAddressString: dotenv.get('USDT_CONTRACT_ADDRESS'),
      abiUsdtContractString: dotenv.get('USDT_CONTRACT_ABI'),
      bnbContractAddressString: dotenv.get('CAPSULE_TIME_CONTRACT_ADDRESS'),
      abiBnbContractString: dotenv.get('CAPSULE_TIME_CONTRACT_ABI'),
    );
  });

  sl.registerLazySingletonAsync<OwnerDataSources>(() async {
    return OwnerDataSourcesImpl(
      sharedPreferences: sl(),
    );
  });
  // Core

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingletonAsync(() async {
    return sharedPreferences;
  });
}
