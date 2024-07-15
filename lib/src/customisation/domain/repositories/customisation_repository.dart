import 'package:tasino/core/error/failures.dart';
import 'package:tasino/src/customisation/domain/entities/app_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class CustomisationRepository {
  Future<Either<Failure, bool>> initAppParameters();
  Future<Either<Failure, bool>> setAppParameters(AppParameters parameters);
  Future<Either<Failure, AppParameters>> getAppParameters();
  Future<Either<Failure, bool>> clearAppParameters();
  bool get isAppParametersSet;
  AppParameters get appParameters;
}
