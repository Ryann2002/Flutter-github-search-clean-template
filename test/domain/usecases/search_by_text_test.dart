import 'package:dartz/dartz.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/errors/errors.dart';
import 'package:flutter_git_search/domain/repository/search_repository.dart';
import 'package:flutter_git_search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'search_by_text_test.mocks.dart';

@GenerateMocks([ISearchRepository])
void main() {
  late ISearchRepository repository;
  late SearchByTextImpl usecase;
  setUp(() {
    repository = MockISearchRepository();
    usecase = SearchByTextImpl(repository);
  });

  test("Deve retornar uma lista de ResultSearch", () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));
    final result = await usecase("Ryan");
    expect(result!.fold(id, id), isA<List<ResultSearch>>());
  });

  test("Deve retornar uma InvalidText caso o texto seja invalido", () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));
    var result = await usecase(null);
    expect(result!.fold(id, id), isA<InvalidText>());
    result = await usecase("");
    expect(result!.fold(id, id), isA<InvalidText>());
  });
}
