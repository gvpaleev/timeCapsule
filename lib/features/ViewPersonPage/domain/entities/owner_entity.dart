import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String address;
  final String balanceBNB;
  final String balanceUSDT;

  const OwnerEntity({
    required this.address,
    required this.balanceBNB,
    required this.balanceUSDT,
  });

  // const OwnerEntity({required this.privateKey});

  @override
  // TODO: implement props
  List<Object?> get props => [address];
}
