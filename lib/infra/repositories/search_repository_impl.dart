import 'package:dartz/dartz.dart';

import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/domain/repository/search_repository.dart';
import 'package:flutter_git_search/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements ISearchRepository {
  final ISearchDataSource dataSource;
  SearchRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<FailureSearch, List<ResultSearch>>?> search(
      String? searchText) async {
    try {
      final result = await dataSource.getSearch(searchText);
      return Right(result!);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
