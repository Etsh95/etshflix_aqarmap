import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_popular_movies.dart';

class _MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late _MockMovieRepository mockRepo;
  late GetPopularMoviesUseCase usecase;

  setUp(() async {
    mockRepo = _MockMovieRepository();
    await sl.reset();
    sl.registerSingleton<MovieRepository>(mockRepo);
    usecase = GetPopularMoviesUseCase();
  });

  test('calls repo.getPopularMovies and returns its Either', () async {
    final expected = Right<dynamic, dynamic>([]);
    when(() => mockRepo.getPopularMovies()).thenAnswer((_) async => expected);

    final result = await usecase();

    expect(result, expected);
    verify(() => mockRepo.getPopularMovies()).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
