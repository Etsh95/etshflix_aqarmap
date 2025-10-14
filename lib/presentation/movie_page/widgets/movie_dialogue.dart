import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/video_overview.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/video_player.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/video_release_date.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/video_title.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/video_vote_average.dart';
import 'package:flutter/material.dart';

class MovieDialogueBody extends StatelessWidget {
  const MovieDialogueBody({required this.movieEntity, super.key});

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    // build your poster + description + runtime + genres here
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VideoPlayer(id: movieEntity.id!),
          const SizedBox(height: 16),
          VideoTitle(title: movieEntity.title!),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
              VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
            ],
          ),
          const SizedBox(height: 16),
          VideoOverview(overview: movieEntity.overview!),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}
