import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/local_user_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/local_user_repository.dart';

class GetLocalUser {
  final LocalUserRepository localUserRepository;

  GetLocalUser(this.localUserRepository);

  Future<LocalUserEntity> call() async {
    return await localUserRepository.getLocalUser();
  }
}
