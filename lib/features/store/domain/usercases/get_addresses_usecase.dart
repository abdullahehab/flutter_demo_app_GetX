import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/core/error/failure.dart';
import 'package:flutter_demo_app/features/store/domain/entities/address.dart';
import 'package:flutter_demo_app/features/store/domain/repository/base_home_base_reposotory.dart';

class GetAddressUseCase {
  final BaseHomePageRepository _repository;

  GetAddressUseCase(this._repository);

  Future<Either<Failure, List<Address>>> call() async {
    return await _repository.getAddresses();
  }
}
