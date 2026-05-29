import 'package:dartz/dartz.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/domain/value_objects/setting.dart';

abstract class ISettingsRepository {
  Future<Either<Failure, Setting>> getSettings();
  Future<Either<Failure, Setting>> saveSettings(Setting settings);
}