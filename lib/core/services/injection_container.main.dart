part of 'injection_container.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  await _initMatchesList();
}

Future<void> _initMatchesList() async {
  /// Bloc
  sl.registerFactory(
    () => MatchesListCubit(
      matchesList: sl(),
    ),
  );

  /// Use cases
  sl.registerLazySingleton(
    () => MatchesListUsecases(sl()),
  );

  /// Repository
  sl.registerLazySingleton<MatchesListRepo>(
    () => MatchesListRepoImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  /// Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(prefs: sl()),
  );

  ///! External
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => prefs);
}
