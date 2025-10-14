import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingMoviesLoaded({required this.movies});
}

class NowPlayingMoviesFailureLoad extends NowPlayingState {
  final String errorMessage;
  NowPlayingMoviesFailureLoad({required this.errorMessage});
}
