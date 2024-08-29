import 'dart:convert';
import 'package:cricket_info/core/errors/exceptions.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class IRemoteDataSource {
  Future<MatchesListModel> matchesList(String email);
}

class RemoteDataSourceImpl extends IRemoteDataSource {
  RemoteDataSourceImpl();
  @override
  Future<MatchesListModel> matchesList(String email) async {
    Map<String, String> headers = {
      "x-rapidapi-key": "6222025a26msh4e70fded642820ap17cc3ejsn94d9c9cfed51",
      "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
      "Content-Type": "application/json",
    };
    try {
      final response = await  http.get(
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
