import 'package:cricket_info/core/common/matches/match_type_filter_widget.dart';
import 'package:cricket_info/core/common/matches/matches_list.dart';
import 'package:flutter/material.dart';

class MobileMatches extends StatelessWidget {
  const MobileMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        MatchTypeFilterWidget(),
        Expanded(child: MatchesListWidget())
      ],
    );
  }
}
