import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/person_repository.dart';

class GetPersons {
  final PersonRepository personRepository;

  GetPersons(this.personRepository);

  Future<Iterable<PersonEntity>> call() async {
    return await personRepository.getPersons();
  }
}
