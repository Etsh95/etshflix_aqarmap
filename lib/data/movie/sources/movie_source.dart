import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:etshflix_aqarmap/core/constants/api_url.dart';
import 'package:etshflix_aqarmap/core/network/dio_client.dart';
import 'package:etshflix_aqarmap/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getPopularMovies();
  Future<Either> getTopRatedMovies();
  Future<Either> getUpcomingMovies();
  Future<Either> getMovieTrailer(int movieId);
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getPopularMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popular);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getTopRatedMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.topRated);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUpcomingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.upcoming);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await sl<DioClient>().get('${ApiUrl.movie}$movieId/videos${ApiUrl.apiKey}');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
