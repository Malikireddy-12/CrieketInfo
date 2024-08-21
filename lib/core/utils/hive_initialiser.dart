import 'package:cricket_info/src/matches/data/data_source/remote/remote_data.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:hive/hive.dart';


Future<void> initialiseHive() async {
  //key
  // const postsKey = 'MatchesList';
  // //adapters
  // Hive.registerAdapter(MatchesListModelAdapter());
  // //box
  // final postsBox = await Hive.openBox<MatchesListModel?>(postsKey);
  // //repos
  // RemoteDataSourceImpl(postsBox);
}
