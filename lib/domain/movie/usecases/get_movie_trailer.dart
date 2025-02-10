import 'package:dartz/dartz.dart';
import 'package:movie_verse/core/usecase/usecase.dart';
import 'package:movie_verse/domain/movie/repositories/movie.dart';
import 'package:movie_verse/service_locator.dart';

class GetMovieTrailerUsecase extends UseCase<Either,int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }





}