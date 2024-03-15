import 'package:TimeCapsule/features/ViewPersonPage/domain/entities/local_user_entity.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/local_user_repository.dart';
import 'package:TimeCapsule/features/ViewPersonPage/domain/repositories/web3_repository.dart';

class SendComment {
  final Web3Repository web3repository;
  final LocalUserRepository localUserRepository;

  SendComment({
    required this.web3repository,
    required this.localUserRepository,
  });

  Future<bool> call() async {
    return true;
  }
}
