import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:cricket_info/src/matches/presentation/views/recent_matches_screen.dart';
import 'package:cricket_info/src/matches/presentation/widgets/mobile_matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/services/injection_container.dart' as di;
import 'core/services/injection_container.dart';
import 'core/services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchesListCubit>(
          create: (context) => sl<MatchesListCubit>(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        // onGenerateRoute: generateRoute,
        home: Matches(),
      ),
    );
  }
}
