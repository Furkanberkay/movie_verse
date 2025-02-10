import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/core/constants/api_url.dart';
import 'package:movie_verse/core/network/dio_client.dart';
import 'package:movie_verse/service_locator.dart';

abstract class MovieService {
  Future<Either<String, dynamic>> getTrendingMovies();
  Future<Either<String, dynamic>> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  

}

class MovieApiServiceImp1 extends MovieService {
  @override
  Future<Either<String, dynamic>> getTrendingMovies() async {
    try {
      // Make API request using DioClient
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);

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

  @override
  Future<Either<String, dynamic>> getNowPlayingMovies() async {
    try {
      // Make API request using DioClient
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);

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

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      // API çağrısı
      var response = await sl<DioClient>().get('${ApiUrl.movie}$movieId/trailer');

      // Log ekleyelim
      print("API Response for Trailer: ${response.data}");

      // Response kontrolü
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left('Server returned status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Log hata detaylarını
      print("DioException: ${e.response?.data ?? e.message}");
      if (e.response != null && e.response?.data != null) {
        return Left(e.response?.data['message'] ?? 'Unknown error occurred');
      } else {
        return Left('Network error: ${e.message}');
      }
    } catch (e) {
      // Log diğer hatalar
      print("Unexpected error: $e");
      return Left('An unexpected error occurred: $e');
    }
  }

}
