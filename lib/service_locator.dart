
import 'package:get_it/get_it.dart';
import 'package:movie_verse/core/network/dio_client.dart';
import 'package:movie_verse/data/auth/repositories/auth.dart';
import 'package:movie_verse/data/auth/sources/auth_api_service.dart';
import 'package:movie_verse/domain/auth/repositories/auth.dart';
import 'package:movie_verse/domain/auth/usercases/signin.dart';
import 'package:movie_verse/domain/auth/usercases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerLazySingleton<DioClient>(() => DioClient());

  //service
  sl.registerLazySingleton<AuthApiService>(() => AuthApiServiceImp1());
  
  //repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp1());

  //usecases
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase());



  

}