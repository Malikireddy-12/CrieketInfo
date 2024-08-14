import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileMatches extends StatefulWidget {
  const MobileMatches({super.key});

  @override
  State<MobileMatches> createState() => _MobileMatchesState();
}

class _MobileMatchesState extends State<MobileMatches> {
  @override
  void initState() {
    super.initState();
    context.read<MatchesListCubit>().matchesListAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MatchesListCubit, MatchesListState>(
        listener: (context, state) {
          if (state is MatchesListError) {
            if (kDebugMode) {
              print("");
            }
          }
        },
        builder: (context, state) {
          if (state is MatchesListLoaded) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Text("${state.response.typeMatches[index].matchType}");
                },
                itemCount: state.response.typeMatches.length);
          }else{
            return const Center(child: Text('Unknown state'));
          }

        },
      ),
    );
  }
}
