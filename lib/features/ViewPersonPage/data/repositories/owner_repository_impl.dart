import 'package:TimeCapsule/features/ViewPersonPage/data/datasources/web3_sources.dart';
import 'package:TimeCapsule/features/ViewPersonPage/data/models/owner_model.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/owner_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/owner_repository.dart';

class OwnerRepositoryImpl extends OwnerRepository {
  final Web3DataSource web3dataSource;

  OwnerRepositoryImpl({
    required this.web3dataSource,
  });

  @override
  Future<OwnerEntity> getOwner() async {
    return OwnerModel(
      address: await web3dataSource.getAddresOwner(),
      balanceBNB: await web3dataSource.getBalanceBnb(),
      balanceUSDT: await web3dataSource.getBalanceUsdt(),
    );
  }
}
