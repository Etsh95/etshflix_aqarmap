import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';

abstract class PopularState {}

class PopularMoviesLoading extends PopularState {}

class PopularMoviesLoaded extends PopularState {
  final List<MovieEntity> movies;
  PopularMoviesLoaded({required this.movies});
}

class PopularMoviesFailureLoad extends PopularState {
  final String errorMessage;
  PopularMoviesFailureLoad({required this.errorMessage});
}
