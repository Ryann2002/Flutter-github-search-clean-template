import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/external/datasources/github_datasource.dart';
import 'package:flutter_git_search/infra/models/search_text_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../utils/github_response.dart';
import 'github_datasource_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  late Dio dio;
  late GitHubDataSource dataSource;

  setUp(() {
    dio = MockDio();
    dataSource = GitHubDataSource(dio: dio);
  });

  const url = "https://api.github.com/search/users?q=";
  const searchedText = "ryan";
  test("Deve retornar uma lista de ResultSearchModel", () async {
    when(dio.get(url + searchedText)).thenAnswer((_) async => Response(
        data: jsonDecode(githubResponse),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));

    final future = dataSource.getSearch(searchedText);
    final result = await dataSource.getSearch(searchedText);

    expect(future, completes);
    expect(result, isA<List<ResultSearchModel>>());
  });

  test("Deve retornar um erro se o statusCode for diferente de 200", () {
    when(dio.get(url + searchedText)).thenAnswer((_) async => Response(
        data: "", statusCode: 404, requestOptions: RequestOptions(path: '')));

    final future = dataSource.getSearch(searchedText);

    expect(future, throwsA(isA<DataSourceError>()));
  });

  test("Deve retornar um HttpClientError se o houver um erro no dio", () {
    when(dio.get(url + searchedText)).thenThrow(Exception());

    final future = dataSource.getSearch(searchedText);
    expect(future, throwsA(isA<HttpClientError>()));
  });
}
