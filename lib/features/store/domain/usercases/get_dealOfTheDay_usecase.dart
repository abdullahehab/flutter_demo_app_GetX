import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/core/error/failure.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';
import 'package:flutter_demo_app/features/store/domain/repository/base_home_base_reposotory.dart';

class GetDealOfTheDayUseCase {
  final BaseHomePageRepository _repository;

  GetDealOfTheDayUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await _repository.getDealOfTheDay();
  }
}
