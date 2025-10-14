import 'package:etshflix_aqarmap/common/widgets/movie/movie_card.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/upcoming_cubit.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/upcoming_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpcomingCubit()..getUpcomingMovies(),
      child: BlocBuilder<UpcomingCubit, UpcomingState>(
        builder: (context, state) {
          if (state is UpcomingMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UpcomingMoviesLoaded) {
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
          if (state is UpcomingMoviesFailureLoad) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
