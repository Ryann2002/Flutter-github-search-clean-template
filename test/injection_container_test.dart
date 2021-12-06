import 'package:dartz/dartz.dart';
import 'package:flutter_git_search/Utils/usecase.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import "package:flutter_git_search/injection_container.dart" as di;
import 'package:flutter_git_search/presenters/blocs/search_bloc.dart';

main() {
  di.init();
  GetIt getIt = GetIt.I;

  final usecase = getIt.get<UseCase<List<ResultSearch>>>();
  final bloc = getIt.get<SearchBloc>();
  test("Deve recuperar o usecase sem erro", () {
    expect(usecase, isA<SearchByTextImpl>());
  });

  test("Deve trazer uma lista de Result Search", () async {
    final result = await usecase.call("search");
    expect(result!.fold(id, id), isA<List<ResultSearch>>());
  });

  test("Deve retornar um erro caso o texto esteja vazio", () async {
    final result = await usecase("");
    expect(result!.fold(id, id), isA<FailureSearch>());
  });

  test("Deve retornar informe um null para a pesquisa", () async {
    final result = await usecase("");
    expect(result!.fold(id, id), isA<FailureSearch>());
  });

  test("Deve retornar um bloc sem erro", () async {
    expect(bloc, isA<SearchBloc>());
  });
}
