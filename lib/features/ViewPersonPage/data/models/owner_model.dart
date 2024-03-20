import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    required super.privateKey,
    required super.address,
    required super.balanceBNB,
    required super.balanceUSDT,
  });
}
