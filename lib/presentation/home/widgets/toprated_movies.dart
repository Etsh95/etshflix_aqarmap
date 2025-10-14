import 'package:etshflix_aqarmap/common/widgets/movie/movie_card.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/toprated_cubit.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/toprated_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopRatedCubit()..getTopRatedMovies(),
      child: BlocBuilder<TopRatedCubit, TopRatedMoviesState>(
        builder: (context, state) {
          if (state is TopRatedMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TopRatedMoviesLoaded) {
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
          if (state is TopRatedMoviesFailureLoad) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
