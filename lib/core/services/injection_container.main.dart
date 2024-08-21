part of 'injection_container.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  await _initMatchesList();
}

Future<void> _initMatchesList() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerFactory(
    () => MatchesListCubit(
      matchesList: sl(),
    ),
  );
  sl.registerLazySingleton(() => MatchesListUsecases(sl()));
  sl.registerLazySingleton<MatchesListRepo>(() => MatchesListRepoImpl(sl()));
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(local: sl()),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sl()),
  );

  //repos
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => prefs);
}
