import 'package:dartz/dartz.dart';
import 'package:etshflix_aqarmap/common/helper/navigation/mapper/movie_mapper.dart';
import 'package:etshflix_aqarmap/common/helper/navigation/mapper/trailer_mapper.dart';
import 'package:etshflix_aqarmap/data/movie/models/movie_model.dart';
import 'package:etshflix_aqarmap/data/movie/models/movie_trailer.dart';
import 'package:etshflix_aqarmap/data/movie/sources/movie_source.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['results'],
        ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['results'],
        ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getPopularMovies() async {
    var returnedData = await sl<MovieService>().getPopularMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['results'],
        ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getTopRatedMovies() async {
    var returnedData = await sl<MovieService>().getTopRatedMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['results'],
        ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getUpcomingMovies() async {
    var returnedData = await sl<MovieService>().getUpcomingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(
          data['results'],
        ).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
  final either = await sl<MovieService>().getMovieTrailer(movieId);

  return either.fold(
    (error) {
        return Left(error);
      },
    (data) {
      final results = (data['results'] as List? ?? const [])
          .whereType<Map<String, dynamic>>()
          .where((v) => (v['type']?.toString().toLowerCase() == 'trailer'))
          .toList();

      if (results.isEmpty) return const Left('Trailer not found.');

      final first = results.first;
      return Right(TrailerMapper.toEntity(TrailerModel.fromJson(first)));
    },
  );
}
}
