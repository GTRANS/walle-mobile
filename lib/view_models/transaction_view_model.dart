import '../model/api/transaction_api.dart';
import '../model/transaction_model.dart';
import '../services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ChangeNotifier {
  ApiResponse<List<Transaction>>? _transactions =
      ApiResponse(status: ApiStatus.success);

  ApiResponse<List<Transaction>>? get transactions => _transactions;

  void changeState(ApiResponse<List<Transaction>>? state) {
    _transactions = state;
    notifyListeners();
  }

  Future<ApiResponse<List<Transaction>>> get(
      {required TransactionStatus status}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await TransactionAPI.get(status: status);
      changeState(
          ApiResponse<List<Transaction>>(status: ApiStatus.success, data: res));
    } catch (e) {
      if (e is DioError) {
        changeState(ApiResponse(
            status: ApiStatus.error,
            message: (e.response?.data ??
                {'message': e.message} as dynamic)['pesan'] as dynamic));
      } else {
        changeState(ApiResponse(status: ApiStatus.error, message: "Error!!!"));
      }
    }
    return Future.value(_transactions);
  }
}
