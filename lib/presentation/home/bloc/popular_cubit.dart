import 'package:etshflix_aqarmap/domain/movie/usecases/get_popular_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/popular_state.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularMoviesLoading());

  void getPopularMovies() async {
    var returnedData = await sl<GetPopularMoviesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(PopularMoviesFailureLoad(errorMessage: error));
      },
      (data) {
        emit(PopularMoviesLoaded(movies: data));
      },
    );
  }
}
