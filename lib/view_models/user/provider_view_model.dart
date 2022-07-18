import '../../model/api/provider_api.dart';
import '../../model/provider_model.dart';
import '../../services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProviderViewModel extends ChangeNotifier {
  ApiResponse<List<Provider>>? _providers =
      ApiResponse(status: ApiStatus.success);

  ApiResponse<List<Provider>>? get providers => _providers;

  void changeState(ApiResponse<List<Provider>>? state) {
    _providers = state;
    notifyListeners();
  }

  Future<ApiResponse<List<Provider>>> get({required int providerId}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await ProviderAPI.get(providerId: providerId);
      changeState(
          ApiResponse<List<Provider>>(status: ApiStatus.success, data: res));
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
    return Future.value(_providers);
  }
}
