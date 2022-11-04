import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/core/error/failure.dart';
import 'package:flutter_demo_app/features/store/domain/entities/address.dart';
import 'package:flutter_demo_app/features/store/domain/entities/categories.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';

abstract class BaseHomePageRepository {
  Future<Either<Failure, List<Address>>> getAddresses();
  Future<Either<Failure, List<Categories>>> getCategories();
  Future<Either<Failure, List<Product>>> getDealOfTheDay();
  Future<Either<Failure, Product>> getBanner();
}
