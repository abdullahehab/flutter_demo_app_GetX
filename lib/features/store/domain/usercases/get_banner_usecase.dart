import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/core/error/failure.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';
import 'package:flutter_demo_app/features/store/domain/repository/base_home_base_reposotory.dart';

class GetBannerUseCase {
  final BaseHomePageRepository _repository;

  GetBannerUseCase(this._repository);

  Future<Either<Failure, Product>> call() async {
    return await _repository.getBanner();
  }
}
