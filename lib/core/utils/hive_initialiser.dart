import 'package:hive/hive.dart';

import '../../src/matches/data/data_source/remote/remote_data.dart';
import '../../src/matches/data/matches_list_model.dart';

Future<void> initialiseHive() async {
  //key
  const postsKey = 'MatchesList';
  //adapters
  Hive.registerAdapter(MatchesListModelAdapter());
  //box
  final postsBox = await Hive.openBox<MatchesListModel?>(postsKey);
  //repos
  RemoteDataSource(postsBox: postsBox);
}
