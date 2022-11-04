import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String title;
  final String street;
  final int buildingNo;
  final int floor;

  const Address(
      {required this.title,
      required this.street,
      required this.buildingNo,
      required this.floor});

  @override
  List<Object> get props => [title, street, buildingNo, floor];
}
