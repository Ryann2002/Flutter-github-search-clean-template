part of 'search_bloc.dart';

abstract class SearchState {}

class SearchSucess implements SearchState {
  final List<ResultSearch> list;

  SearchSucess(this.list);
}

class SearchOnError implements SearchState {
  final FailureSearch error;

  SearchOnError(this.error);
}

class SearchLoading implements SearchState {}

class SearchIdle implements SearchState {}
