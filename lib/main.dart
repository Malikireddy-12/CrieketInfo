import 'package:cricket_info/core/utils/appInitialiser.dart';
import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:cricket_info/src/matches/presentation/views/recent_matches_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInitialiser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => sl<MatchesListCubit>(),
        child:   const Matches(),
      ),
    );
  }
}
