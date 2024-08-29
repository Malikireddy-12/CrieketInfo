import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchTypeFilterWidget extends StatelessWidget {
  const MatchTypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesListCubit, MatchesListState>(
      builder: (context, state) {
        if (state is MatchesListLoaded) {
          return SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => context
                        .read<MatchesListCubit>()
                        .selectMatchTypeFilter(state.filters.matchType[index],index),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: state.selectedMatchFilter == index
                                ? Colors.blue
                                : Colors.white, // Background color
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 10, // Blur radius
                                offset: const Offset(0, 5), // Shadow position
                              ),
                            ],
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            child: Text(
                              state.filters.matchType[index],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: state.selectedMatchFilter == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          )),
                    ),
                  );
                },
                itemCount: state.filters.matchType.length),
          );
        } else if (state is MatchesListLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 7.0,
              color: Colors.blue,
              strokeCap: StrokeCap.round,
            ),
          );
        } else if (state is MatchesListError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Data available'));
        }
      },
    );
  }
}
