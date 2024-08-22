import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../model/matches_list_model.dart';

abstract class LocalDataSource {
  Future<void> setMatchList(String value);

  Future<MatchesListModel> getMatchList();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl({required SharedPreferences prefs}) : _prefs = prefs;
  final SharedPreferences _prefs;

  @override
  Future<void> setMatchList(String value) async {
    try {
      await _prefs.setString("matchList", value);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<MatchesListModel> getMatchList() async {
    try {
      final result = _prefs.getString("matchList");
      return MatchesListModel.fromJson(jsonDecode(result!));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
