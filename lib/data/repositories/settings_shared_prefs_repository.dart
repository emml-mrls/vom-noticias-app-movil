import 'package:dartz/dartz.dart';
import 'package:vom_app/core/error/exceptions.dart';
import 'package:vom_app/data/models/settings_model.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/data/services/settings_shared_preferences_service.dart';
import 'package:vom_app/domain/value_objects/setting.dart';
import 'package:vom_app/domain/repositories/i_settings_repository.dart';

class SettingsSharedPrefsRepository implements ISettingsRepository {
  final SettingsSharedPreferencesService sharedPreferences;

  SettingsSharedPrefsRepository({required this.sharedPreferences});

  @override
  Future<Either<Failure, Setting>> saveSettings(Setting settings) async {
    try {
      await sharedPreferences.saveSharedPrefs(SettingsModel.fromEntity(settings).toMap());
      return Right(settings);
    }
    on StorageException {
      return left(SaveSettingsFailure());
    }
    catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Setting>> getSettings() async{
    try {
      return right(SettingsModel.fromMap(await sharedPreferences.getSharedPrefs()).toEntity());
    } 
    on StorageException {
      return left(GetSettingsFailure());
    }
    catch (e) {
      return left(UnknownFailure());
    }
  }
}