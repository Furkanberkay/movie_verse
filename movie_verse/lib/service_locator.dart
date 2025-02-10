
import 'package:get_it/get_it.dart';
import 'package:movie_verse/core/network/dio_client.dart';
import 'package:movie_verse/data/auth/repositories/auth.dart';
import 'package:movie_verse/data/auth/sources/auth_api_service.dart';
import 'package:movie_verse/data/movie/repositories/movie.dart';
import 'package:movie_verse/data/movie/sources/movie.dart';
import 'package:movie_verse/data/tv/repositories/tv.dart';
import 'package:movie_verse/data/tv/sources/tv.dart';
import 'package:movie_verse/domain/auth/repositories/auth.dart';
import 'package:movie_verse/domain/auth/usercases/is_logged_in.dart';
import 'package:movie_verse/domain/auth/usercases/signin.dart';
import 'package:movie_verse/domain/auth/usercases/signup.dart';
import 'package:movie_verse/domain/movie/repositories/movie.dart';
import 'package:movie_verse/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_verse/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_verse/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_verse/domain/tv/repositories/tv.dart';
import 'package:movie_verse/domain/tv/usecases/get_popular_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  //service
  sl.registerSingleton<AuthService>(AuthApiServiceImp1());
  sl.registerSingleton<MovieService>(MovieApiServiceImp1());
  sl.registerSingleton<TVService>(TVApiServiceImp1());


  
  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImp1());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImp1());
  sl.registerSingleton<TVRepositories>(TVRepositoryImp1());




  //usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUsecase>(GetPopularTvUsecase());
  sl.registerSingleton<GetMovieTrailerUsecase>(GetMovieTrailerUsecase());










  

}