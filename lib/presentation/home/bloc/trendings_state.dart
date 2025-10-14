import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';

abstract class TrendingsState {}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;
  TrendingsMoviesLoaded({required this.movies});
}

class TrendingsMoviesFailureLoad extends TrendingsState {
  final String errorMessage;
  TrendingsMoviesFailureLoad({required this.errorMessage});
}
