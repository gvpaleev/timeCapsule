import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';

abstract class LocalUserRepository {
  Future<OwnerEntity> getLocalUser();
}
