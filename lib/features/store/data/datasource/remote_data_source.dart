import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/store/data/model/address_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
}

class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  @override
  Future<List<AddressModel>> getAddresses() async {
    final String response =
        await rootBundle.loadString(AppConstants.addressesFilePath);
    return List<AddressModel>.from(
        jsonDecode(response).map((x) => AddressModel.fromJson(x)));
  }
}
