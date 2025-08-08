import 'dart:io';
import 'package:app_settings/app_settings.dart';

void openDisplaySettings() {
  if (Platform.isAndroid) {
    AppSettings.openAppSettings(type: AppSettingsType.display);
  } else if (Platform.isIOS) {
    AppSettings.openAppSettings(type: AppSettingsType.settings);
  }
}

void openSoundSettings() {
  if (Platform.isAndroid) {
    AppSettings.openAppSettings(type: AppSettingsType.sound);
  } else if (Platform.isIOS) {
    AppSettings.openAppSettings(type: AppSettingsType.settings);
  }
}

void openNotificationsSettings() {
  // Android: pode abrir a tela de notificações
  // iOS: abre configurações do app, onde o usuário gerencia notificações
  AppSettings.openAppSettings(type: AppSettingsType.notification);
}

void openAdvancedSettings() {
  AppSettings.openAppSettings(type: AppSettingsType.settings);
}

void openAccountSettings() {
  AppSettings.openAppSettings(type: AppSettingsType.lockAndPassword);
}
