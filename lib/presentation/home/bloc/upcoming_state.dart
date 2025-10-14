import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';

abstract class UpcomingState {}

class UpcomingMoviesLoading extends UpcomingState {}

class UpcomingMoviesLoaded extends UpcomingState {
  final List<MovieEntity> movies;
  UpcomingMoviesLoaded({required this.movies});
}

class UpcomingMoviesFailureLoad extends UpcomingState {
  final String errorMessage;
  UpcomingMoviesFailureLoad({required this.errorMessage});
}
