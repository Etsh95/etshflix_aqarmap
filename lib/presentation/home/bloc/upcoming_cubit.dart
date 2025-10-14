import 'package:etshflix_aqarmap/domain/movie/usecases/get_upcoming_movies.dart';
import 'package:etshflix_aqarmap/presentation/home/bloc/upcoming_state.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit() : super(UpcomingMoviesLoading());

  void getUpcomingMovies() async {
    var returnedData = await sl<GetUpcomingUseCase>().call();

    returnedData.fold(
      (error) {
        emit(UpcomingMoviesFailureLoad(errorMessage: error));
      },
      (data) {
        emit(UpcomingMoviesLoaded(movies: data));
      },
    );
  }
}
