import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_git_search/presenters/blocs/search_bloc.dart';
import "package:flutter_git_search/injection_container.dart" as di;

main() {
  di.init();
  GetIt getIt = GetIt.I;
  test("Deve emitir os eventos em ordem", () {
    var bloc = getIt.get<SearchBloc>();
    expect(
        bloc.stream,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSucess>(),
        ]));
    bloc.add(Search("ryan"));
  });
}
