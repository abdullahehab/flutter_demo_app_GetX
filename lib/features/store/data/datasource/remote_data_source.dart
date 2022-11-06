import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/store/data/model/address_model.dart';
import 'package:flutter_demo_app/features/store/data/model/category_model.dart';
import 'package:flutter_demo_app/features/store/data/model/product_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getDealOfTheDay();
  Future<ProductModel> getBanner();
}

class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  @override
  Future<List<AddressModel>> getAddresses() async {
    final String response =
        await rootBundle.loadString(AppConstants.addressesFilePath);
    return List<AddressModel>.from(
        jsonDecode(response).map((x) => AddressModel.fromJson(x)));
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final String response =
        await rootBundle.loadString(AppConstants.categoriesFilePath);
    return List<CategoryModel>.from(
        jsonDecode(response).map((x) => CategoryModel.fromJson(x)));
  }

  @override
  Future<List<ProductModel>> getDealOfTheDay() async {
    final String response =
        await rootBundle.loadString(AppConstants.productFilePath);
    return List<ProductModel>.from(
        jsonDecode(response).map((x) => ProductModel.fromJson(x)));
  }

  @override
  Future<ProductModel> getBanner() async {
    final String response =
        await rootBundle.loadString(AppConstants.productFilePath);
    return List<ProductModel>.from(
        jsonDecode(response).map((x) => ProductModel.fromJson(x)))[1];
  }
}
