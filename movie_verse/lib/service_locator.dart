
import 'package:get_it/get_it.dart';
import 'package:movie_verse/core/network/dio_client.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
}