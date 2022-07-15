import '../model/api/transaction_api.dart';
import '../model/transaction_model.dart';
import '../services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ChangeNotifier {
  ApiResponse<List<Transaction>>? _transactions =
      ApiResponse(status: ApiStatus.success);

  ApiResponse<List<Transaction>>? get transactions => _transactions;

  ApiResponse<Transaction>? _transaction =
      ApiResponse(status: ApiStatus.success);

  ApiResponse<Transaction>? get transaction => _transaction;

  void changeListState(ApiResponse<List<Transaction>>? state) {
    _transactions = state;
    notifyListeners();
  }

  void changeState(ApiResponse<Transaction>? state) {
    _transaction = state;
    notifyListeners();
  }

  Future<ApiResponse<List<Transaction>>> get(
      {required TransactionStatus status}) async {
    try {
      changeListState(ApiResponse(status: ApiStatus.loading));
      final res = await TransactionAPI.get(status: status);
      changeListState(
          ApiResponse<List<Transaction>>(status: ApiStatus.success, data: res));
    } catch (e) {
      if (e is DioError) {
        changeListState(ApiResponse(
            status: ApiStatus.error,
            message: (e.response?.data ??
                {'message': e.message} as dynamic)['pesan'] as dynamic));
      } else {
        changeListState(
            ApiResponse(status: ApiStatus.error, message: "Error!!!"));
      }
    }
    return Future.value(_transactions);
  }

  Future<ApiResponse<Transaction>> bankPayment(
      {required BankTransactionInput input}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await TransactionAPI.bankPayment(input: input);
      changeState(
          ApiResponse<Transaction>(status: ApiStatus.success, data: res));
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
    return Future.value(_transaction);
  }

  Future<ApiResponse<Transaction>> eWalletPayment(
      {required EWalletTransactionInput input}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await TransactionAPI.eWalletPayment(input: input);
      changeState(
          ApiResponse<Transaction>(status: ApiStatus.success, data: res));
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
    return Future.value(_transaction);
  }

  Future<ApiResponse<Transaction>> detail({required int id}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await TransactionAPI.detail(id: id);
      changeState(
          ApiResponse<Transaction>(status: ApiStatus.success, data: res));
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
    return Future.value(_transaction);
  }
}
