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
    status = json['transaction_status'];
    orderId = json['order_id'];
    paymentType = json['payment_type'];
    transactionDate = json['transaction_time'];
    product = Product.fromJson(json['produk']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_status'] = status;
    data['order_id'] = orderId;
    data['payment_type'] = paymentType;
    data['transaction_time'] = transactionDate;
    data['produk'] = product?.toJson();
    return data;
  }
}
