part of 'injection_container.dart';

final GetIt sl = GetIt.instance;
late SharedPreferences prefs;

void setup() async {
  ///!Step 1: Register external dependencies
  prefs = await SharedPreferences.getInstance();
  sl.reset();
sl.registerLazySingleton(() => http.Client());
sl.registerLazySingleton(() => prefs);

  /// Step 2: Register data sources
  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(),
  );

  /// Debug: Confirm registration
  if (sl.isRegistered<RemoteDataSourceImpl>()) {
    if (kDebugMode) {
      print('RemoteDataSourceImpl is successfully registered in GetIt.');
    }
  } else {
    if (kDebugMode) {
      print('Failed to register RemoteDataSourceImpl in GetIt.');
    }
  }

  /// Debug: Confirm registration
  if (sl.isRegistered<LocalDataSourceImpl>()) {
    if (kDebugMode) {
      print('LocalDataSourceImpl is successfully registered in GetIt.');
    }
  } else {
    if (kDebugMode) {
      print('Failed to register LocalDataSourceImpl in GetIt.');
    }
  }

  /// Step 3: Register repositories
  sl.registerLazySingleton<MatchesListRepo>(
        () => MatchesListRepoImpl(
        sl<RemoteDataSourceImpl>(), sl<LocalDataSourceImpl>()),
  );

  /// Debug: Confirm registration
  if (sl.isRegistered<MatchesListRepoImpl>()) {
    if (kDebugMode) {
      print('MatchesListRepoImpl is successfully registered in GetIt.');
    }
  } else {
    if (kDebugMode) {
      print('Failed to register MatchesListRepoImpl in GetIt.');
    }
  }

  /// Step 4: Register use cases
  sl.registerLazySingleton(
          () => MatchesListUsecases(sl<MatchesListRepoImpl>()));

  /// Debug: Confirm registration
  if (sl.isRegistered<MatchesListUsecases>()) {
    if (kDebugMode) {
      print('MatchesListUsecases is successfully registered in GetIt.');
    }
  } else {
    if (kDebugMode) {
      print('Failed to register MatchesListUsecases in GetIt.');
    }
  }

  /// Step 5: Register the Cubit
  sl.registerFactory(() => MatchesListCubit(sl<MatchesListUsecases>()));

  /// Debug: Confirm registration
  if (sl.isRegistered<MatchesListCubit>()) {
    if (kDebugMode) {
      print('MatchesListCubit is successfully registered in GetIt.');
    }
  } else {
    if (kDebugMode) {
      print('Failed to register MatchesListCubit in GetIt.');
    }
  }


  // sl
  //   ..registerFactory(() => MatchesListCubit(sl()))
  //   ..registerLazySingleton(() => MatchesListUsecases(sl()))
  //   ..registerLazySingleton<MatchesListRepo>(
  //       () => MatchesListRepoImpl(sl(), sl()))
  //   ..registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl())
  //   ..registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
