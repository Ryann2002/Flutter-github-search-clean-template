import 'package:bloc/bloc.dart';
import 'package:flutter_git_search/Utils/usecase.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:rxdart/rxdart.dart';
part "events.dart";
part "states.dart";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final UseCase<List<ResultSearch>> usecase;
  SearchBloc(this.usecase) : super(SearchIdle()) {
    on<Search>(
      (event, emit) async {
        return await _onSearch(event, emit);
      },
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  Future<void> _onSearch(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await usecase(event.searchText);
    result!.fold(
      (failure) => emit(SearchOnError(failure)),
      (list) => emit(SearchSucess(list)),
    );
  }
}
