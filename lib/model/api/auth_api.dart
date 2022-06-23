import '../../model/auth_model.dart';
import '../../services/services.dart';

class AuthAPI {
  static Future<TokenResult> login({required LoginInput input}) async {
    Services repo = Services();
    final response = await repo.post(url: '/user/login', data: input);

    return await Future.value(TokenResult.fromJson(response));
  }

  static Future<TokenResult> register({required RegisterInput input}) async {
    Services repo = Services();
    final response = await repo.post(url: '/user', data: input);

    return await Future.value(TokenResult.fromJson(response));
  }

  static Future<TokenResult> verification(
      {required VerificationInput input}) async {
    Services repo = Services();
    final response = await repo.post(url: '/user/verifikasi', data: input);

    return await Future.value(TokenResult.fromJson(response));
  }
}
