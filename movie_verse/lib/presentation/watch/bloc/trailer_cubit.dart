import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/entity/trailer.dart';
import 'package:movie_verse/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_verse/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_verse/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    if (isClosed) return; // Bloc kapatıldıysa işlem yapılmaz.

    var returnedData = await sl<GetMovieTrailerUsecase>().call(params: movieId);

    returnedData.fold(
          (error) {
        emit(FailuerLoadTrailer(errorMessage: error));
      },
          (data) async {
        TrailerEntity trailerEntity = data;

        // Trailer key doğrulama
        if (trailerEntity.key == null || trailerEntity.key!.isEmpty) {
          emit(FailuerLoadTrailer(errorMessage: 'Video not found.'));
          return;
        }

        // YouTube Player Controller oluşturma
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );

        if (isClosed) return; // Bloc yeniden kontrol
        emit(TrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}