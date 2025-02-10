import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_verse/presentation/home/bloc/trendings_state.dart';
import 'package:movie_verse/service_locator.dart';

class TrendindCubit extends Cubit<TrendingState> {
  TrendindCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    if (isClosed) return; // Bloc kapatıldıysa işlem yapılmaz.
    emit(TrendingMoviesLoading());
    var result = await sl<GetTrendingMoviesUseCase>().call();
    result.fold(
          (error) => emit(FailureLoadTrendingMovies(errorMessage: error)),
          (movies) => emit(TrendingMoviesLoaded(movies: movies)),
    );
  }

}