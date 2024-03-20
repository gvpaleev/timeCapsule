import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/local_user_repository.dart';

class GetLocalUser {
  final LocalUserRepository localUserRepository;

  GetLocalUser(this.localUserRepository);

  Future<OwnerEntity> call() async {
    return await localUserRepository.getLocalUser();
  }
}
