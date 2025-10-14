import 'package:etshflix_aqarmap/common/widgets/movie/movie_card.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/popular_cubit.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/popular_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularCubit()..getPopularMovies(),
      child: BlocBuilder<PopularCubit, PopularState>(
        builder: (context, state) {
          if (state is PopularMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PopularMoviesLoaded) {
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
          if (state is PopularMoviesFailureLoad) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
