import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/owner_repository.dart';

class GetLocalUser {
  final OwnerRepository localUserRepository;

  GetLocalUser(this.localUserRepository);

  Future<OwnerEntity> call() async {
    return await localUserRepository.getLocalUser();
  }
}
