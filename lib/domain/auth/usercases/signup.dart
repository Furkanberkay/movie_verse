import 'package:dartz/dartz.dart';
import 'package:movie_verse/core/usecase/usecase.dart';
import 'package:movie_verse/data/auth/models/signup_req_params.dart';
import 'package:movie_verse/domain/auth/repositories/auth.dart';
import 'package:movie_verse/service_locator.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams> {

  @override
  Future<Either> call({SignupReqParams? params}) async{
    return await sl<AuthRepository>().signup(params!);
  }



}