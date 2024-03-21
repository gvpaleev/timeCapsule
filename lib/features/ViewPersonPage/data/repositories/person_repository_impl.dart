import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/web3_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/person_repository.dart';

class PersonRepositoryImpl extends PersonRepository {
  final Web3DataSource web3dataSource;

  PersonRepositoryImpl({required this.web3dataSource});

  @override
  Future<Iterable<PersonEntity>> getPersons() async {
    return web3dataSource.getPersons();
  }

  @override
  Future<bool> setComment(int id, String comment) async {
    return true;
  }
}
