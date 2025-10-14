import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:etshflix_aqarmap/domain/movie/repositories/movie_repository.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_trendings_movies.dart';

class _MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late _MockMovieRepository mockRepo;
  late GetTrendingsMoviesUseCase usecase;

  setUp(() async {
    mockRepo = _MockMovieRepository();
    await sl.reset();
    sl.registerSingleton<MovieRepository>(mockRepo);
    usecase = GetTrendingsMoviesUseCase();
  });

  test('calls repo.getTrendingMovies and returns its Either', () async {
    // Arrange
    final expected = Right<dynamic, dynamic>([]);
    when(() => mockRepo.getTrendingMovies()).thenAnswer((_) async => expected);

    // Act
    final result = await usecase();

    // Assert
    expect(result, expected);
    verify(() => mockRepo.getTrendingMovies()).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
