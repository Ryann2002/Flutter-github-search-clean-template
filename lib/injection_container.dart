import 'package:dio/dio.dart';
import 'package:flutter_git_search/Utils/usecase.dart';
import 'package:flutter_git_search/domain/entities/result_search.dart';
import 'package:flutter_git_search/domain/repository/search_repository.dart';
import 'package:flutter_git_search/domain/usecases/search_by_text.dart';
import 'package:flutter_git_search/external/datasources/github_datasource.dart';
import 'package:flutter_git_search/infra/datasources/search_datasource.dart';
import 'package:flutter_git_search/infra/repositories/search_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_git_search/presenters/blocs/search_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! BLOC
  sl.registerFactory<SearchBloc>(() => SearchBloc(sl()));

  //! USECASES
  sl.registerFactory<UseCase<List<ResultSearch>>>(() => SearchByTextImpl(sl()));

  //! Repository
  sl.registerFactory<ISearchRepository>(
      () => SearchRepositoryImpl(dataSource: sl()));

  //! DATASOURCE
  sl.registerFactory<ISearchDataSource>(() => GitHubDataSource(dio: sl()));
  sl.registerLazySingleton(() => Dio());
}
