import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_movie_trailer.dart';

class _MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late _MockMovieRepository mockRepo;
  late GetMovieTrailerUseCase usecase;

  setUp(() async {
    mockRepo = _MockMovieRepository();
    await sl.reset();
    sl.registerSingleton<MovieRepository>(mockRepo);
    usecase = GetMovieTrailerUseCase();
  });

  test('calls repo.getMovieTrailer with movieId and returns its Either', () async {
    const movieId = 42;
    final expected = Right<dynamic, dynamic>({'id': movieId});
    when(() => mockRepo.getMovieTrailer(movieId)).thenAnswer((_) async => expected);

    final result = await usecase(params: movieId);

    expect(result, expected);
    verify(() => mockRepo.getMovieTrailer(movieId)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
