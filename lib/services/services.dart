import 'package:dio/dio.dart';

enum ApiStatus { success, loading, error }

class ApiResponse<T> {
  late T? data;
  late ApiStatus status;
  late String? message;

  ApiResponse({this.data, required this.status, this.message});
}

class Services {
  static Dio? _dio;

  Services._internal() {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: 'https://bearuang.me',
      ),
    );
    _dio?.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
  Services._assignToken([String? token]) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://bearuang.me',
        headers: token != null ? {'authorization': 'Bearer $token'} : null,
      ),
    );
    _dio?.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }
  factory Services() {
    return Services._internal();
  }

  factory Services.assignToken([String? token]) {
    return Services._assignToken(token);
  }

  Future<dynamic>? get({required String url}) async {
    Response<dynamic>? res = await _dio?.get(url);
    return Future.value(res?.data);
  }

  Future<dynamic>? post<T>({required String url, required T data}) async {
    Response<dynamic>? res = await _dio?.post(url, data: data);
    return Future.value(res?.data);
  }

  Future<dynamic>? delete<T>({required String url}) async {
    Response<dynamic>? res = await _dio?.delete(url);
    return Future.value(res?.data);
  }

  Future<dynamic>? patch<T>({required String url, required T data}) async {
    Response<dynamic>? res = await _dio?.patch(url, data: data);
    return Future.value(res?.data);
  }
}
