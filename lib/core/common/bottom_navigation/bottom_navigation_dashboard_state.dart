part of 'bottom_navigation_dashboard_cubit.dart';

abstract class BottomNavigationDashboardState {
  final int index;
  const BottomNavigationDashboardState({
    required this.index,
  });

  List<Object> get props => [index];
}

class HomeIndex extends BottomNavigationDashboardState {
  const HomeIndex() : super(index: 0);
}

class MatchesIndex extends BottomNavigationDashboardState {
  const MatchesIndex() : super(index: 1);
}

class VideosIndex extends BottomNavigationDashboardState {
  const VideosIndex() : super(index: 2);
}

class NewsIndex extends BottomNavigationDashboardState {
  const NewsIndex() : super(index: 3);
}

class MoreIndex extends BottomNavigationDashboardState {
  const MoreIndex() : super(index: 4);
}
