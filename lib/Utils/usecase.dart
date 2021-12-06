import 'package:dartz/dartz.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';

abstract class UseCase<Type> {
  Future<Either<FailureSearch, Type>?> call(String? searchText);
}
