part of 'injection_container.dart';

final sl = GetIt.instance;
late SharedPreferences prefs;

Future<void> setup() async {

  ///!Step 1: Register external dependencies
  prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => prefs);

  /// Step 2: Register data sources
  sl.registerLazySingleton(
    () => RemoteDataSourceImpl(),
  );
  sl.registerLazySingleton(() => LocalDataSourceImpl());

  /// Step 3: Register repositories
  sl.registerLazySingleton(
    () => MatchesListRepoImpl(sl(), sl()),
  );

  /// Step 4: Register use cases
  sl.registerLazySingleton(
      () => MatchesListUsecases(sl<MatchesListRepoImpl>()));

  /// Step 5: Register the Cubit
  sl.registerFactory(() => MatchesListCubit(sl<MatchesListUsecases>()));
}
