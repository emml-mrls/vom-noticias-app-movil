import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/domain/value_objects/setting.dart';
import 'package:vom_app/domain/repositories/i_settings_repository.dart';

class SettingsViewModel extends ChangeNotifier{
  final ISettingsRepository _sharedprefs;
  SettingsViewModel(this._sharedprefs);
  Setting? _settings;
  Setting? get settings => _settings;
  bool isLoading = false;
  Failure? error;
  
  Future<void> _updateSettings(Setting Function(Setting) transform) async{
    if (_settings == null) return;
    error = null;
    isLoading = true;
    notifyListeners();
    Either<Failure, Setting> response = await _sharedprefs.saveSettings(transform(_settings!));
    response.fold(
      (error) => this.error = error, 
      (setting) => _settings = setting
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleDarkMode (bool isDarkMode) async{
    await _updateSettings((s) => s.copyWith(isDarkMode: isDarkMode));
  }

  Future<void> toggleNotifications (bool notificationsEnabled) async{
    await _updateSettings((s) =>s.copyWith(notificationsEnabled: notificationsEnabled));
  }

  Future<void> toggleFontScale (double fontScale) async{
    await _updateSettings((s) => s.copyWith(fontScale: fontScale));
  }

  Future<void> showSettings () async {
    isLoading = true;
    notifyListeners();
    Either<Failure, Setting> response = await _sharedprefs.getSettings();
    response.fold(
      (error) => this.error = error, 
      (setting) =>  _settings = setting
    );
    isLoading = false;
    notifyListeners();
  }
}