import 'package:movie_verse/core/usecase/usecase.dart';
import 'package:movie_verse/domain/auth/repositories/auth.dart';
import 'package:movie_verse/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool,dynamic> {

  @override
  Future<bool> call({params}) async{
    return await sl<AuthRepository>().isLoggedIn();
  }



}