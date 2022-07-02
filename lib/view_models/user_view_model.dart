import '../model/api/auth_api.dart';
import 'package:dio/dio.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  ApiResponse<User>? _user = ApiResponse(status: ApiStatus.success);
  ApiResponse<User>? get user => _user;

  void changeUserState(ApiResponse<User>? state) {
    _user = state;
    notifyListeners();
  }

  Future<ApiResponse<User>> getInfo() async {
    try {
      changeUserState(ApiResponse(status: ApiStatus.loading));
      final res = await AuthAPI.getMe();
      changeUserState(ApiResponse<User>(data: res, status: ApiStatus.success));
    } catch (e) {
      if (e is DioError) {
        changeUserState(ApiResponse(
            status: ApiStatus.error,
            message: (e.response?.data ??
                {'message': e.message} as dynamic)['pesan'] as dynamic));
      } else {
        changeUserState(
            ApiResponse(status: ApiStatus.error, message: "Error!!!"));
      }
    }
    return Future.value(_user);
  }
}
