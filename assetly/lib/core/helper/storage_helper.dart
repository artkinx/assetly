import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  StorageHelper._internal();
  static final StorageHelper _instance = StorageHelper._internal();

  factory StorageHelper() => _instance;

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static FlutterSecureStorage? storage;

  static void init() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }
}
