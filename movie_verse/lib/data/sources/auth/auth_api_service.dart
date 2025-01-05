import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/core/network/dio_client.dart';

import '../../../service_locator.dart';

abstract class AuthApiService {

  Future<Either> signup();
}


class AuthApiServiceImp1 extends AuthApiService {
  @override
  Future<Either> signup() async{
    try {
      var response = await sl<DioClient>().post(

      );

    }on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}