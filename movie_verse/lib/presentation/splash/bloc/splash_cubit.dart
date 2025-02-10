import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/domain/auth/usercases/is_logged_in.dart';
import 'package:movie_verse/presentation/splash/bloc/splash_state.dart';
import 'package:movie_verse/service_locator.dart';

class SplashCubit extends Cubit<SplashState>{

  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if(isLoggedIn) {
      emit(Authenticated());
    }else {
      emit(
          UnAuthenticated()
      );
    }

    emit(
      UnAuthenticated()
    );
  }
}