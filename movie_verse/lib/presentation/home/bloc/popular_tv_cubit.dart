import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_verse/presentation/home/bloc/popular_tv_state.dart';
import 'package:movie_verse/service_locator.dart';


class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async {
    if (isClosed) return; // Bloc kapatıldıysa işlem yapılmaz.
    emit(PopularTVLoading());
    var result = await sl<GetPopularTvUsecase>().call();
    result.fold(
          (error) => emit(FailureLoadPopularTV(errorMessage: error)),
          (movies) => emit(PopularTVLoaded(tv: movies)),
    );
  }

}