import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';

abstract class OwnerRepository {
  Future<OwnerEntity> getOwner();
}
