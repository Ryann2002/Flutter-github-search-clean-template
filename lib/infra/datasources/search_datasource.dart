import 'package:flutter_git_search/infra/models/search_text_model.dart';

abstract class ISearchDataSource {
  Future<List<ResultSearchModel>?> getSearch(String? searchText);
}
