import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCache {
  static Future<void> insertToCache({
    required String key,
    required String value,
  }) {
    const localStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
    return localStorage.write(key: key, value: value);
  }

  static Future<String> getFromCache({required String key}) async {
    const localStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );

    return await localStorage.read(key: key) ?? '';
  }

  static Future<void> deleteFromCache() {
    const localStorage = FlutterSecureStorage();

    return localStorage.deleteAll();
  }
}
