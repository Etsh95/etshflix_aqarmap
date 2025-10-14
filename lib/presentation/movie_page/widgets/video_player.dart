import 'package:etshflix_aqarmap/presentation/movie_page/widgets/trailer_cubit.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/trailer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
              bottomActions: const [
                CurrentPosition(),
                SizedBox(width: 8),
                ProgressBar(isExpanded: true),
                SizedBox(width: 8),
                PlaybackSpeedButton(),
                RemainingDuration(),
              ],
            );
          }
          if (state is TrailerLoadFailure) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
