import 'package:dartz/dartz.dart';
import 'package:movie_verse/data/auth/models/signin_req_params.dart';
import 'package:movie_verse/data/auth/models/signup_req_params.dart';
import 'package:movie_verse/data/auth/sources/auth_api_service.dart';
import 'package:movie_verse/domain/auth/repositories/auth.dart';
import 'package:movie_verse/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp1 extends AuthRepository {


  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signup(params);
   return data.fold(
        (error) {
          return Left(error);
        },
        (data) async {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', data['user']['token']);
          return Right(data);
        }
    );
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signin(params);
    return data.fold(
            (error) {
          return Left(error);
        },
            (data) async {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', data['user']['token']);
          return Right(data);
        }
    );
  }
}



