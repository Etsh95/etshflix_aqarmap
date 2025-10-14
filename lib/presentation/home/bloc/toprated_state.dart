import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';

abstract class TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<MovieEntity> movies;
  TopRatedMoviesLoaded({required this.movies});
}

class TopRatedMoviesFailureLoad extends TopRatedMoviesState {
  final String errorMessage;
  TopRatedMoviesFailureLoad({required this.errorMessage});
}
