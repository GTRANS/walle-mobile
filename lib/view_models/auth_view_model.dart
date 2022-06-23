import '../../model/api/auth_api.dart';
import '../../model/auth_model.dart';
import 'package:dio/dio.dart';

import '../../services/services.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  ApiResponse<TokenResult>? _token = ApiResponse(status: ApiStatus.success);

  ApiResponse<TokenResult>? get token => _token;

  void changeState(ApiResponse<TokenResult>? state) {
    _token = state;
    notifyListeners();
  }

  Future<ApiResponse<TokenResult>> login({required LoginInput input}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await AuthAPI.login(input: input);
      changeState(
          ApiResponse<TokenResult>(status: ApiStatus.success, data: res));
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
    return Future.value(_token);
  }

  Future<ApiResponse<TokenResult>> register(
      {required RegisterInput input}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await AuthAPI.register(input: input);
      changeState(
          ApiResponse<TokenResult>(status: ApiStatus.success, data: res));
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
    return Future.value(_token);
  }

  Future<ApiResponse<TokenResult>> verification(
      {required VerificationInput input}) async {
    try {
      changeState(ApiResponse(status: ApiStatus.loading));
      final res = await AuthAPI.verification(input: input);
      changeState(
          ApiResponse<TokenResult>(status: ApiStatus.success, data: res));
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
    return Future.value(_token);
  }
}
