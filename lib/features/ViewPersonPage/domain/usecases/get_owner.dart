import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/owner_repository.dart';

class GetOwner {
  final OwnerRepository localUserRepository;

  GetOwner(this.localUserRepository);

  Future<OwnerEntity> call() async {
    return await localUserRepository.getOwner();
  }
}
