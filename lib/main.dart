import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/bottom_navigation/bottom_navigation_dashboard_cubit.dart';
import 'core/common/bottom_navigation/bottom_navigationbar_dashboard.dart';
import 'core/services/injection_container.dart' as di;
import 'core/services/injection_container.dart';
import 'core/services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchesListCubit>(
          create: (context) => sl(),
        ),

        BlocProvider<BottomNavigationDashboardCubit>(
          create: (context) => BottomNavigationDashboardCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: generateRoute,
        home: BottomNavigationBarDashboard(),
      ),
    );
  }
}
