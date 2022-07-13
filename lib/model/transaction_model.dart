import '../model/product_model.dart';

enum TransactionStatus { success, pending, fail }

extension ParseToString on TransactionStatus {
  String getValue() {
    if (this == TransactionStatus.success) {
      return 'berhasil';
    } else if (this == TransactionStatus.pending) {
      return 'tertunda';
    } else {
      return 'gagal';
    }
  }
}

class Transaction {
  int? id;
  String? status;
  String? orderId;
  String? paymentType;
  String? transactionDate;
  Product? product;

  Transaction(
      {this.id,
      this.status,
      this.orderId,
      this.paymentType,
      this.transactionDate,
      this.product});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status_transaksi'];
    orderId = json['order_id'];
    paymentType = json['metode_pembayaran'];
    transactionDate = json['waktu_transaksi'];
    product = Product.fromJson(json['produk']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status_transaksi'] = status;
    data['order_id'] = orderId;
    data['metode_pembayaran'] = paymentType;
    data['waktu_transaksi'] = transactionDate;
    data['produk'] = product?.toJson();
    return data;
  }
}

class BankTransactionInput {
  int? userId;
  int? productId;
  String? bank;

  BankTransactionInput({this.userId, this.productId, this.bank});

  BankTransactionInput.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['produk_id'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['produk_id'] = productId;
    data['bank'] = bank;
    return data;
  }
}

class EWalletTransactionInput {
  int? userId;
  int? productId;

  EWalletTransactionInput({this.userId, this.productId});

  EWalletTransactionInput.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['produk_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['produk_id'] = productId;
    return data;
  }
}
