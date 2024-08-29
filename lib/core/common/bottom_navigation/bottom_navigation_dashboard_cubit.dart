import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_dashboard_state.dart';

class BottomNavigationDashboardCubit
    extends Cubit<BottomNavigationDashboardState> {
  BottomNavigationDashboardCubit() : super(const HomeIndex());
  gotoScreen(int index) {
    switch (index) {
      case 0:
        emit(const HomeIndex());
        break;
      case 1:
        emit(const MatchesIndex());
        break;
      case 2:
        emit(const VideosIndex());
        break;
      case 3:
        emit(const NewsIndex());
        break;
      case 4:
        emit(const MoreIndex());
        break;
    }
  }
}
