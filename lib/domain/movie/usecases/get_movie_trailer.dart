import 'package:dartz/dartz.dart';
import 'package:etshflix_aqarmap/core/usecase/usecase.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/service_locator.dart';

class GetMovieTrailerUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }
}
