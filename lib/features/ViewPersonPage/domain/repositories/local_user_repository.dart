import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/local_user_entity.dart';

abstract class LocalUserRepository {
  Future<LocalUserEntity> getLocalUser();
}
