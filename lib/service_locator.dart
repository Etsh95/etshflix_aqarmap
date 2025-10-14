import 'package:etshflix_aqarmap/core/network/dio_client.dart';
import 'package:etshflix_aqarmap/data/movie/repositories/movie_repository_implementation.dart';
import 'package:etshflix_aqarmap/data/movie/sources/movie_source.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_movie_trailer.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_popular_movies.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_toprated_movies.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_trendings_movies.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_upcoming_movies.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<GetTrendingsMoviesUseCase>(GetTrendingsMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase());
  sl.registerSingleton<GetTopRatedMoviesUseCase>(GetTopRatedMoviesUseCase());
  sl.registerSingleton<GetUpcomingUseCase>(GetUpcomingUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());

}
