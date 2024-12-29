
import 'package:app/base_hieu/services/base_request.dart';
import 'package:app/base_hieu/storage_app.dart';
import 'package:app/main.dart';
import 'package:dio/dio.dart';

abstract class RestApiClient {
  RestApiClient({
    required this.dio,
  });

  final Dio dio;
  Map<String, dynamic>? _headers;
  Future<Map<String, dynamic>> getBaseHeader() async {
    bool isTokenExprited = StorageApp.isTokenExprited();
    String _token = StorageApp.token;
    String _userName = StorageApp.userName;
    if (isTokenExprited) {
      _token = await getNewToken();
    }
    Map<String, String> map = {
      'Authorization': "Bearer $_token",
      'ad-username': _userName,
    };
    return map;
  }

  Future sendRequest({
    required RequestMethod? requestMethod,
    required String path,
    dynamic param,
    dynamic body,
    bool sendHeader = true,
    ResponseType? responseType,
    String? contentType,
    Options? options,
  }) async {
    _headers = sendHeader ? await getBaseHeader() : null;
    var res = await _requestByMethod(
      method: requestMethod ?? RequestMethod.PATCH,
      path: path.startsWith(dio.options.baseUrl)
          ? path.substring(dio.options.baseUrl.length)
          : path,
      queryParameters: param,
      body: body,
      options: Options(
        headers: _headers,
        contentType: contentType ?? options?.contentType,
        responseType: responseType ?? options?.responseType,
        sendTimeout: options?.sendTimeout,
        receiveTimeout: options?.receiveTimeout,
      ),
    );
    return res.data;
  }

  Future<Response<dynamic>> _requestByMethod({
    required RequestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
  }) {
    switch (method) {
      case RequestMethod.GET:
        return dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RequestMethod.POST:
        return dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RequestMethod.PATCH:
        return dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RequestMethod.PUT:
        return dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RequestMethod.DELETE:
        return dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }

  Future<String> getNewToken() async {
    logger.i("Refresh token...");
    String newToken = '';
    try {
      // var res = await LoginRepositoryIml().refreshToken();
      // if (res.isSuccessed) {
      //   newToken = res.data!.accessToken;
      //   StorageApp.setTimeExpriredToken(res.data!.expiresIn);
      // }
    } catch (e) {
      newToken = '';
    }
    StorageApp.setTokenAuthen(newToken);
    return newToken;
  }
}
