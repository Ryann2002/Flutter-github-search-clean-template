import 'package:dartz/dartz.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';

abstract class ISearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>?> search(String? searchText);
}
