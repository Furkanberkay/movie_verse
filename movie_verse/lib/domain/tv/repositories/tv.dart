import 'package:dartz/dartz.dart';

abstract class TVRepositories {

  Future<Either> getPopularTV();
}