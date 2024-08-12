import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/errors/exceptions.dart';
import '../../matches_list_model.dart';

abstract class RemoteData {
  Future<void> matchesList(String email);
}

class RemoteDataSource implements RemoteData {
  RemoteDataSource(
      {required Box<MatchesListModel?> postsBox})
      : _postsBox = postsBox;
  final _client = http.Client();
  final Box<MatchesListModel?> _postsBox;
  @override
  Future<MatchesListModel> matchesList(String email) async {
    Map<String, String> headers = {
      "x-rapidapi-key": "5c59a5e06emsh951c5f48674aeaap1f3580jsna233cd1d13f4",
      "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com"
    };
    try {
      final response = await _client.get(
          Uri.parse(
              'https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent'),
          headers: headers);

      if (response.statusCode != 200) {
        throw const ServerException(
          message: 'Please try again later',
          statusCode: 'Unknown Error',
        );
      }
      return MatchesListModel.fromJson(jsonDecode(response.body));
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
  Future<void> savePostsLocally({
    required MatchesListModel post,
  }) async {
      await _postsBox.put("matchList", post);
  }
}
