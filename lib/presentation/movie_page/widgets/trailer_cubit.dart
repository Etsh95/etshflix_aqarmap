import 'package:etshflix_aqarmap/domain/movie/entities/trailer.dart';
import 'package:etshflix_aqarmap/domain/movie/usecases/get_movie_trailer.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/trailer_state.dart';
import 'package:etshflix_aqarmap/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(TrailerLoadFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;

        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(autoPlay: false, mute: false),
        );

        emit(TrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}
