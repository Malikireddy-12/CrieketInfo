import 'package:cricket_info/core/utils/responsive_builder.dart';
import 'package:cricket_info/src/matches/presentation/widgets/desktop_matches.dart';
import 'package:cricket_info/src/matches/presentation/widgets/mobile_matches.dart';
import 'package:cricket_info/src/matches/presentation/widgets/tablet_matches.dart';
import 'package:flutter/material.dart';

class Matches extends StatelessWidget {
  const Matches({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenTypeLayout.builder(
      mobile: (p0) => const MobileMatches(),
      tablet: (p0) => const TabletMatches(),
      desktop: (p0) => const DesktopMatches(),
    );
  }
}
