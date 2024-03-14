import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<List<PersonEntity>> getAllPerson();
  Future<List<PersonEntity>> searchPerson(String name);
}
