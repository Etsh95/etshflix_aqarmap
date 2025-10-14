import 'package:etshflix_aqarmap/common/widgets/movie/movie_card.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/now_playing_cubit.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/now_playing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NowPlayingMoviesLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.movies.length,
              ),
            );
          }
          if (state is NowPlayingMoviesFailureLoad) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
