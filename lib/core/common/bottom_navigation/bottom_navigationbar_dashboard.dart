import 'package:cricket_info/core/common/page_under_construction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/matches/presentation/bloc/matches_list_cubit.dart';
import '../../../src/matches/presentation/widgets/mobile_matches.dart';
import '../../services/injection_container.dart';
import 'bottom_navigation_dashboard_cubit.dart';

class BottomNavigationBarDashboard extends StatefulWidget {
  const BottomNavigationBarDashboard({super.key});

  @override
  State<BottomNavigationBarDashboard> createState() =>
      _BottomNavigationBarDashboardState();
}

class _BottomNavigationBarDashboardState
    extends State<BottomNavigationBarDashboard> {
  final List _pages = [
    const PageUnderConstruction(),
    BlocProvider<MatchesListCubit>(
      create: (context) => sl()..matchesListAPi(),
      child: const MobileMatches(),
    ),
    const PageUnderConstruction(),
    const PageUnderConstruction(),
    const PageUnderConstruction(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationDashboardCubit,
        BottomNavigationDashboardState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: _pages[state.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) => context
                .read<BottomNavigationDashboardCubit>()
                .gotoScreen(index),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12.0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 35.0), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cable_sharp, size: 35.0), label: "Matches"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_fill_sharp, size: 35.0),
                  label: "Videos"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper_sharp, size: 35.0), label: "News"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz, size: 35.0), label: "More"),
            ],
          ),
        ),
    );
  }
}
