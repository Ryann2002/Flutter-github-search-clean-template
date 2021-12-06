import 'package:dartz/dartz.dart';
import 'package:flutter_git_search/Utils/usecase.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/domain/repository/search_repository.dart';

class SearchByTextImpl implements UseCase<List<ResultSearch>> {
  final ISearchRepository repository;

  SearchByTextImpl(this.repository);
  @override
  Future<Either<FailureSearch, List<ResultSearch>>?> call(
      String? searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidText());
    }
    return await repository.search(searchText);
  }
}
