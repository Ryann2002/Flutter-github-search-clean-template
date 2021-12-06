import 'package:dartz/dartz.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/infra/datasources/search_datasource.dart';
import 'package:flutter_git_search/infra/models/search_text_model.dart';
import 'package:flutter_git_search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'search_repository_test.mocks.dart';

@GenerateMocks([ISearchDataSource])
void main() {
  late ISearchDataSource dataSource;
  late SearchRepositoryImpl repository;
  setUp(() {
    dataSource = MockISearchDataSource();
    repository = SearchRepositoryImpl(dataSource: dataSource);
  });
  test("Deve retornar uma lista de ResultSearch", () async {
    when(dataSource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("ryan");
    expect(result!.fold(id, id), isA<List<ResultSearch>>());
  });

  test("Deve retornar um DataSourceError se o DataSource falhar", () async {
    when(dataSource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("ryan");
    expect(result!.fold(id, id), isA<DataSourceError>());
  });
}
