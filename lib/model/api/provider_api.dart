import '../../model/provider_model.dart';
import '../../services/local_storage.dart';
import '../../services/services.dart';

class ProviderAPI {
  static Future<List<Provider>> get({required int providerId}) async {
    LocalStorage storage = LocalStorage();
    final token = await storage.get(key: 'auth_token');
    Services repo = Services.assignToken(token);
    final response = await repo.get(url: '/provider/$providerId');

    return await Future.value(response['provider']
        .map<Provider>((e) => Provider.fromJson(e))
        .toList());
  }
}
