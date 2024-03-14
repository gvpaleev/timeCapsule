import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/person_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/person_repository.dart';

class GetAllPersons {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  Future<List<PersonEntity>> call() async {
    return await personRepository.getAllPerson();
  }
}
