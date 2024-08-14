part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initMatchesList();
}

Future<void> _initMatchesList() async {
  //key
  const postsKey = 'MatchesList';
  //box
  final postsBox = await Hive.openBox<MatchesListModel?>(postsKey);
  // Feature --> OnBoarding
  // Business Logic
  sl..registerFactory(
      () => MatchesListCubit(
        matchesList: sl(),
      ),
    )
    ..registerLazySingleton(() => MatchesListUsecases(sl()))
    ..registerLazySingleton<MatchesListRepo>(() => MatchesListRepoImpl(sl()))
    ..registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl()),
    )

    //repos
    ..registerLazySingleton(() => postsBox);
}
