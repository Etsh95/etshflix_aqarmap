import 'package:etshflix_aqarmap/domain/movie/usecases/get_trendings_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/trendings_state.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingsMoviesLoading());

  void getTrendingsMovies() async {
    var returnedData = await sl<GetTrendingsMoviesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(TrendingsMoviesFailureLoad(errorMessage: error));
      },
      (data) {
        emit(TrendingsMoviesLoaded(movies: data));
      },
    );
  }
}
