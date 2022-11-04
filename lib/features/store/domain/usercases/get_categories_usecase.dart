import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/core/error/failure.dart';
import 'package:flutter_demo_app/features/store/domain/entities/categories.dart';
import 'package:flutter_demo_app/features/store/domain/repository/base_home_base_reposotory.dart';

class GetCategoriesUseCase {
  final BaseHomePageRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<Either<Failure, List<Categories>>> call() async {
    return await _repository.getCategories();
  }
}
