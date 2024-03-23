import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/owner_repository.dart';

class GetOwner {
  final OwnerRepository ownerRepository;

  GetOwner(this.ownerRepository);

  Future<OwnerEntity> call() async {
    return await ownerRepository.getOwner();
  }
}
