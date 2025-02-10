import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/domain/movie/entities/movie.dart';
import 'package:movie_verse/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_verse/service_locator.dart';

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

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingMoviesLoaded({required this.movies});
}

class FailureLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;

  FailureLoadNowPlayingMovies({required this.errorMessage});
}
