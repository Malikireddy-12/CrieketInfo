import 'dart:convert';
import 'package:cricket_info/core/errors/exceptions.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../local/local_data.dart';

abstract class RemoteDataSource {
  Future<void> matchesList(String email);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({required http.Client client}) : _client = client;
  final http.Client _client;
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
}
