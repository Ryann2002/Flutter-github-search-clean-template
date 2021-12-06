part of "search_bloc.dart";

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Search extends SearchEvent {
  final String? searchText;

  Search(this.searchText);

  @override
  List<Object?> get props => [searchText];
}
