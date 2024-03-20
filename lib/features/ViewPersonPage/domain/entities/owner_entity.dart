import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String privateKey;
  // final String address;

  const OwnerEntity({required this.privateKey});

  @override
  // TODO: implement props
  List<Object?> get props => [privateKey];
}
