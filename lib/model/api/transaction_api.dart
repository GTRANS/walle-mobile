import '../../services/local_storage.dart';
import '../../services/services.dart';
import '../../model/transaction_model.dart';

class TransactionAPI {
  static Future<List<Transaction>> get(
      {required TransactionStatus status}) async {
    LocalStorage storage = LocalStorage();
    final token = await storage.get(key: 'auth_token');
    Services repo = Services.assignToken(token);
    final filter = status.getValue();
    final response = await repo.get(url: '/transaksi/user?filter=$filter');

    return await Future.value(response['transaksi']
        .map<Transaction>((e) => Transaction.fromJson(e))
        .toList());
  }
}
