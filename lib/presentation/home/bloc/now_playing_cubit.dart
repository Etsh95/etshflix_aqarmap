import 'package:etshflix_aqarmap/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/now_playing_state.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(NowPlayingMoviesFailureLoad(errorMessage: error));
      },
      (data) {
        emit(NowPlayingMoviesLoaded(movies: data));
      },
    );
  }
}
