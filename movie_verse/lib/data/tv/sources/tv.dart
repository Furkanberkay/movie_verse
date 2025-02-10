import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/core/constants/api_url.dart';
import 'package:movie_verse/core/network/dio_client.dart';
import 'package:movie_verse/service_locator.dart';

abstract class TVService {

  Future<Either> getPopularTv();
}

class TVApiServiceImp1 extends TVService{


  @override
  Future<Either> getPopularTv() async {
    try {
      // Make API request using DioClient
      var response = await sl<DioClient>().get(ApiUrl.popularTV);

      // Check if response is valid
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left('Server returned status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio-specific exceptions
      if (e.response != null && e.response?.data != null) {
        return Left(e.response?.data['message'] ?? 'Unknown error occurred');
      } else {
        return Left('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle any other exceptions
      return Left('An unexpected error occurred: $e');
    }
  }

}