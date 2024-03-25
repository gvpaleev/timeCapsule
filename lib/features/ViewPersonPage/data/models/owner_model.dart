import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    required super.address,
    required super.balanceBNB,
    required super.balanceUSDT,
    required super.privateKey,
  });
}
