import '../../model/product_model.dart';
import '../../services/local_storage.dart';
import '../../services/services.dart';

class ProductAPI {
  static Future<List<Product>> get(
      {required int categoryId, required int providerId}) async {
    LocalStorage storage = LocalStorage();
    final token = await storage.get(key: 'auth_token');
    Services repo = Services.assignToken(token);

    final response = await repo.get(
        url: '/produk?kategori=$categoryId&provider=$providerId');

    return await Future.value(
        response['produk'].map<Product>((e) => Product.fromJson(e)).toList());
  }
}
