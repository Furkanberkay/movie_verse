import 'package:dartz/dartz.dart';
import 'package:movie_verse/common/helper/mapper/tv_mapper.dart';
import 'package:movie_verse/data/tv/models/tv.dart';
import 'package:movie_verse/data/tv/sources/tv.dart';
import 'package:movie_verse/domain/tv/repositories/tv.dart';
import 'package:movie_verse/service_locator.dart';

class TVRepositoryImp1 extends TVRepositories{
  @override
  Future<Either> getPopularTV() async {
    var returnData = await sl<TVService>().getPopularTv();

    return returnData.fold(
            (error) {
          return Left(error);

        },
            (data) {
          var movies = List.from(data['content']).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }

}