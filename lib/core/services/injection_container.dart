

import 'package:cricket_info/src/matches/data/data_source/local/local_data.dart';
import 'package:cricket_info/src/matches/data/data_source/remote/remote_data.dart';
import 'package:cricket_info/src/matches/data/repos/matches_list_repo_impl.dart';
import 'package:cricket_info/src/matches/domain/usecases/matches_list_usecase.dart';
import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'injection_container.main.dart';
