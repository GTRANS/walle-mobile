import 'package:flutter/material.dart';
import '../services/local_storage.dart';
import '../services/services.dart';

const tokenKey = "auth_token";

class TokenViewModel extends ChangeNotifier {
  void changeState() {
    notifyListeners();
  }

  Future<void> setToken({required String token}) async {
    LocalStorage storage = LocalStorage();
    await storage.set(key: tokenKey, data: token);
    notifyListeners();
  }

  Future<String?> setupToken() async {
    LocalStorage storage = LocalStorage();
    String? curToken = await storage.get(key: tokenKey);
    Services.assignToken(curToken);
    return await Future.value(curToken);
  }

  Future<void> revokeToken() async {
    LocalStorage storage = LocalStorage();
    await storage.remove(key: tokenKey);
    notifyListeners();
  }
}
