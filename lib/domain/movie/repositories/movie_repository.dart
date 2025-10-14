import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getPopularMovies();
  Future<Either> getTopRatedMovies();
  Future<Either> getUpcomingMovies();
  Future<Either> getMovieTrailer(int movieId);
}
