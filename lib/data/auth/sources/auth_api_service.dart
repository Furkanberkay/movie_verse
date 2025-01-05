import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/core/constants/api_url.dart';
import 'package:movie_verse/core/network/dio_client.dart';
import 'package:movie_verse/data/auth/models/signin_req_params.dart';
import 'package:movie_verse/data/auth/models/signup_req_params.dart';
import 'package:movie_verse/service_locator.dart';


abstract class AuthApiService {

  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);

}


class AuthApiServiceImp1 extends AuthApiService {

  Future<Either> signup(SignupReqParams params) async{
    try {
      var response = await sl <DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);

    }on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await sl <DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);

    }on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}
