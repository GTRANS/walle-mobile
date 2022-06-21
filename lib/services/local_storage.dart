import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<SharedPreferences>? _sharedPreferences;

  LocalStorage._internal() {
    _sharedPreferences ??= SharedPreferences.getInstance();
  }

  factory LocalStorage() {
    return LocalStorage._internal();
  }

  Future<String?> get({required String key}) async {
    final res = await _sharedPreferences;
    return Future.value(res?.getString(key));
  }

  Future<void> set({required String key, required String data}) async {
    final res = await _sharedPreferences;
    await res?.setString(key, data);
  }

  Future<bool?> getBool({required String key}) async {
    final res = await _sharedPreferences;
    return Future.value(res?.getBool(key));
  }

  Future<void> setBool({required String key, required bool data}) async {
    final res = await _sharedPreferences;
    await res?.setBool(key, data);
  }

  Future<void> remove({required String key}) async {
    final res = await _sharedPreferences;
    await res?.remove(key);
  }
}
