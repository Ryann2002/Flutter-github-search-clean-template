import 'package:dio/dio.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/infra/datasources/search_datasource.dart';
import 'package:flutter_git_search/infra/models/search_text_model.dart';

extension on String? {
  String normalize() {
    return this!.replaceAll(" ", "+");
  }
}

class GitHubDataSource implements ISearchDataSource {
  final Dio dio;

  GitHubDataSource({
    required this.dio,
  });

  @override
  Future<List<ResultSearchModel>?> getSearch(String? searchText) async {
    String normalizedString = searchText.normalize();
    const url = "https://api.github.com/search/users?q=";
    try {
      final response = await dio.get(url + normalizedString);

      if (response.statusCode == 200) {
        final list = (response.data["items"] as List)
            .map((e) => ResultSearchModel.fromMap(e))
            .toList();

        return list;
      } else {
        throw DataSourceError();
      }
    } catch (e) {
      throw DataSourceError();
    }
  }
}
