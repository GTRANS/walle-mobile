import '../../model/api/product_api.dart';
import '../../services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductViewModel with ChangeNotifier {
  ApiResponse<List<Product>>? _products =
      ApiResponse(status: ApiStatus.success);

  ApiResponse<List<Product>>? get products => _products;

  void changeState(ApiResponse<List<Product>>? state) {
    _products = state;
    notifyListeners();
  }

  Future<ApiResponse<List<Product>>> get(
      {required int categoryId, required int providerId}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res =
          await ProductAPI.get(categoryId: categoryId, providerId: providerId);
      changeState(
          ApiResponse<List<Product>>(status: ApiStatus.success, data: res));
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
    return Future.value(_products);
  }
}
