import 'package:dartz/dartz.dart';
import 'package:movie_verse/core/usecase/usecase.dart';
import 'package:movie_verse/domain/tv/repositories/tv.dart';
import 'package:movie_verse/service_locator.dart';

class GetPopularTvUsecase extends UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<TVRepositories>().getPopularTV();
  }



}