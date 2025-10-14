import 'package:dartz/dartz.dart';
import 'package:etshflix_aqarmap/core/usecase/usecase.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/service_locator.dart';

class GetPopularMoviesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getPopularMovies();
  }
}
