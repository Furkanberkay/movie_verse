import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/core/entity/trailer.dart';
import 'package:movie_verse/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_verse/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_verse/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUsecase>().call(params: movieId);

    returnedData.fold((error) {
      emit(FailuerLoadTrailer(errorMessage: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
      emit(TrailerLoaded(youtubePlayerController: controller));
    });
  }
}

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoaded({required this.youtubePlayerController});
}

class FailuerLoadTrailer extends TrailerState {
  final String errorMessage;

  FailuerLoadTrailer({required this.errorMessage});
}
