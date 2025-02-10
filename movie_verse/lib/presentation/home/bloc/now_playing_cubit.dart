import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_verse/service_locator.dart';

import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    if (isClosed) return; // Bloc kapatıldıysa işlem yapılmaz.
    emit(NowPlayingMoviesLoading());
    var result = await sl<GetNowPlayingMoviesUseCase>().call();
    result.fold(
          (error) => emit(FailureLoadNowPlayingMovies(errorMessage: error)),
          (movies) => emit(NowPlayingMoviesLoaded(movies: movies)),
    );
  }

}