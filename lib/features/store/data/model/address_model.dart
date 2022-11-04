import 'package:flutter_demo_app/features/store/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.buildingNo,
    required super.title,
    required super.floor,
    required super.street,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      buildingNo: json['building_number'],
      title: json['title'],
      floor: json['floor'],
      street: json['street']);
}
