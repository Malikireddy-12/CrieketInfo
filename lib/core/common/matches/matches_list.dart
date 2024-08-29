import 'package:cricket_info/src/matches/presentation/bloc/matches_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesListWidget extends StatelessWidget {
  const MatchesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesListCubit, MatchesListState>(
      builder: (context, state) {
        if (state is MatchesListLoaded) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal, // Background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 2, // Blur radius
                                offset: const Offset(0, 2), // Shadow position
                              ),
                            ],
                          ),
                          // height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.seriesMatches![index].seriesAdWrapper!
                                        .seriesName!,
                                    style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left:16),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                    color: Colors.black45,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.seriesMatches![index].seriesAdWrapper!
                          .matches!.length,
                      itemBuilder: (context, innerIndex) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            matchTitleWidget(state, index, innerIndex),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        state
                                            .seriesMatches![index]
                                            .seriesAdWrapper!
                                            .matches![innerIndex]
                                            .matchInfo!
                                            .team1!
                                            .teamSName!,
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          state
                                              .seriesMatches![index]
                                              .seriesAdWrapper!
                                              .matches![innerIndex]
                                              .matchInfo!
                                              .team2!
                                              .teamSName!,
                                          style: const TextStyle(
                                              color: Colors.black45,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10,left: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex].matchScore!.team1Score!.inngs1!.runs} - ${state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex].matchScore!.team1Score!.inngs1!.wickets} ${state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex].matchScore!.team1Score!.inngs1!.overs}",
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "${state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex].matchScore!.team2Score!.inngs1!.runs} - ${state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex].matchScore!.team2Score!.inngs1!.wickets} ${state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex].matchScore!.team2Score!.inngs1!.overs}",
                                          style: const TextStyle(
                                              color: Colors.black45,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                state
                                    .seriesMatches![index]
                                    .seriesAdWrapper!
                                    .matches![innerIndex]
                                    .matchInfo!
                                    .status!,
                                // textAlign:TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
              itemCount: state.seriesMatches!.length);
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

  Widget matchTitleWidget(MatchesListLoaded state, int index, int innerIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex]
                .matchInfo!.matchDesc!,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), // Rounded corners
                color: Colors.black54,
              ),
            ),
          ),
          Text(
            state.seriesMatches![index].seriesAdWrapper!.matches![innerIndex]
                .matchInfo!.venueInfo!.city!,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
