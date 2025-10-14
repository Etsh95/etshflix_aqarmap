import 'package:etshflix_aqarmap/domain/movie/usecases/get_toprated_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/toprated_state.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedCubit extends Cubit<TopRatedMoviesState> {
  TopRatedCubit() : super(TopRatedMoviesLoading());

  void getTopRatedMovies() async {
    var returnedData = await sl<GetTopRatedMoviesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(TopRatedMoviesFailureLoad(errorMessage: error));
      },
      (data) {
        emit(TopRatedMoviesLoaded(movies: data));
      },
    );
  }
}
