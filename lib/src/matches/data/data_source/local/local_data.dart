import 'dart:convert';

import 'package:cricket_info/core/services/injection_container.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../model/matches_list_model.dart';

abstract class LocalDataSource {
  Future<void> setMatchList(String value);

  Future<MatchesListModel> getMatchList();
}

class LocalDataSourceImpl extends LocalDataSource {
  LocalDataSourceImpl();
  // LocalDataSourceImpl({required SharedPreferences prefs}) : _prefs = prefs;


  @override
  Future<void> setMatchList(String value) async {
    try {
      await prefs.setString("matchList", value);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<MatchesListModel> getMatchList() async {
    try {
      final result = prefs.getString("matchList");
      return MatchesListModel.fromJson(jsonDecode(result!));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
