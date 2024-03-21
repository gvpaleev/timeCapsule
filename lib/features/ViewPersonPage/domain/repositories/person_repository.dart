import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Iterable<PersonEntity>> getPersons();
  Future<bool> setComment(int id, String comment);
}
